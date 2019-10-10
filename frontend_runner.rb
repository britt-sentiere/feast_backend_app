class FeastClient

  require 'http'
  require 'twilio-ruby'


  def display_main_menu
    
    @selection_array = []

    user_value = ""

    system "clear"

    puts "=" * 80
    puts "Feast App".center(80)
    puts "=" * 80
    puts ""

    puts "Main Menu"
    puts "-" * 80
    puts
    puts "   [1] View All Restaurants"
    puts "   [2] View A Restaurant"
    puts "   [3] Exit App"
    puts 

    print "Pick an option: "
    user_selection = gets.chomp
    puts
    exit if user_selection == "3"

    @restaurant_id = ""

    if user_selection == "1"
      show_restaurants
      choose_restaurant
   
    else
      choose_restaurant
    end

    item_id = ""

    while item_id != "done"
    puts "Select item ID or type 'done'" 
    item_id = gets.chomp
      if item_id != "done"
        add_to_ticket(item_id, @restaurant_id, @selection_array)
      end 
    end 

    show_ticket(user_value, @selection_array)
   

    if user_value == "cancel"
      display_main_menu
    else 
      reserve(user_value, @selection_array)
    end

    exit

  end

  # def main_menu_response(user_selection)
    
  # end

  def show_restaurants
    response = HTTP.get("http://localhost:3000/api/restaurants")

    restaurants = response.parse

    puts "All Restaurants"
    puts "=" * 80
    puts 

    restaurants.each do |restaurant|
      puts "name: #{restaurant["name"]}"
      puts "address: #{restaurant["address"]}"
      puts "cuisine: #{restaurant["cuisine"]}"
      puts "hours: #{restaurant["hours"]}"
      puts "id: #{restaurant["id"]}"
      puts
      puts "-" * 80
      puts
      
    end 
  end

  def choose_restaurant
    puts "Please select a restaurant(by id number): "
    puts
    puts "Return to main menu by typing 'exit'"
    response = gets.chomp
    @restaurant_id = response

    if response == "exit"
      display_main_menu
    else 
      show_restaurant
    end 
  end

  # def choose_item
  #   response = ""
  #    while response != "done" || response != "exit"
  #     puts "Please select an item by id number or type 'done' to complete your order or 'exit' to cancel order"
  #     response = gets.chomp
  #     if response == "exit"
  #       display_main_menu
  #     elsif response == "done"
  #       show_ticket
  #       puts "If this looks correct, type 'order', or type 'modify' to update order, or type 'cancel' if you no longer want this order"
  #       response = gets.chomp 
  #       if response == "cancel"
  #         display_main_menu
  #       elsif response == "order"
  #         reserve
  #       else 

  #       end  
  #     else
  #       add_to_ticket
  #     end 
  #   end
  # end

  def show_restaurant
    response = HTTP.get("http://localhost:3000/api/restaurants/#{@restaurant_id}")
    restaurant = response.parse

    puts "id: #{restaurant["id"]}"
    puts "name: #{restaurant["name"]}"
    puts "address: #{restaurant["address"]}"
    puts "cuisine: #{restaurant["cuisine"]}"
    puts "hours: #{restaurant["hours"]}"
    puts "menu:"
    puts "*" * 80
    show_dishes(restaurant)
  end

  def show_dishes(restaurant)
    # response = HTTP.get("http://localhost:3000/api/restaurants/#{restaurant}")
    # restaurant = response.parse
    dishes = restaurant["dishes"]

    dishes.each do |dish|
      puts "id: #{dish["id"]}"
      puts "name: #{dish["name"]}"
      puts "price: #{dish["price"]}"
      puts "description: #{dish["description"]}"
      puts "-" * 80

    end
  end

  def add_to_ticket(item_id, restaurant_id, selection_array)
    # add one dish at a time to an order

    response = HTTP.get("http://localhost:3000/api/restaurants/#{@restaurant_id}")
    restaurant = response.parse
    
    dishes = restaurant["dishes"]
    dishes.each do |dish|


      if item_id.to_i == dish["id"].to_i
       
        name = dish["name"]
        description = dish["description"]
        price = dish["price"]

        temp_array = ["item_id" => "#{item_id}", "item_name" => "#{name}", "item_description" => "#{description}", "item_price" => "#{price}"]

        @selection_array << temp_array
      end 
    end
  end


  def show_ticket(value, selection_array)


    puts @selection_array
    puts 
    # edit @selection_array display
    # show all dishes and total price so far
    # should also return to show_dishes OR reserve
    # dishes_response (put in if statement) 

    puts "Type 'order' or 'cancel'"
    value = gets.chomp
  end

  def reserve(value, selection_array)

    index = 0
    temp_body = "You have ordered: "


    # while index < @selection_array.count
    #   temp_body += @selection_array[index]["item_name"].to_s + ", " 
    #   index += 1
    # end 

    if value == "cancel"
      puts "Goodbye"
    else 
      puts "Order has been processed!"

      account_sid = ''
      auth_token = ''
      client = Twilio::REST::Client.new(account_sid, auth_token)

      from = '+1' # Your Twilio number
      to = '+1' # Your mobile phone number

      client.messages.create(
      from: from,
      to: to,
      body: temp_body)
    end 
    # call sms_text in tickets controller
    
    # show all dishes and total price in text (not terminal)
    # incorporate twilio here
  end

  # def display_dishes_options
  #   # when in the dishes menu
  #   # displays add to ticket option, show ticket option, and reserve option 
  #   # set user_selection = gets.chomp (translate to to_i)
  #   # display main menu here as well
  # end

  # def dishes_response(user_selection)
  #   # based on user selection (number) run add to ticket, show ticket, or reserve
  # end

  # # always make sure it gives options to go back to another view 


  def run_feast
    display_main_menu
  end
end  
feast = FeastClient.new
feast.run_feast






  

  # if user_selection == "1"
  #   response = HTTP.get("http://localhost:3000/api/restaurants")

  #   restaurants = response.parse
  #   # p restaurants

  #   puts "All Restaurants"
  #   puts "=" * 80
  #   puts 

  #   restaurants.each do |restaurant|
  #     puts "name: #{restaurant["name"]}"
  #     puts "address: #{restaurant["address"]}"
  #     puts "cuisine: #{restaurant["cuisine"]}"
  #     puts "hours: #{restaurant["hours"]}"
  #     puts "id: #{restaurant["id"]}"
  #     puts
  #     puts "-" * 80
  #     puts
      
  #     # p restaurant["id"]
  #     # response = HTTP.get("http://localhost:3000/api/restaurants/#{restaurant.id}")
  #   end 
  # end 



  
# if user_selection == "1"
#   response = HTTP.get("http://localhost:3000/api/dishes")

#   dishes = response.parse

#   puts "All Dishes"
#   puts

#   dishes.each do |dish|
#     puts "id: #{dish["id"]}"
#     puts "name: #{dish["name"]}"
#     puts "price: #{dish["price"]}"
#     puts "description: #{dish["description"]}"
#     puts "@restaurant_id: #{dish["restaurant_id"]}"
#     puts
#     puts ("-" * 60).center(80)
#   end
# elsif user_selection == "2"
#   print "what is the id of the dish you want to view? "
#   dish_id = gets.chomp

#   response = HTTP.get("http://localhost:3000/api/dishes/#{dish_id}")

#   dish = response.parse

#   puts
#   puts "id: #{dish["id"]}"
#   puts "name: #{dish["name"]}"
#   puts "price: #{dish["price"]}"
#   puts "description: #{dish["description"]}"
#   puts "restaurant_id: #{dish["restaurant_id"]}"
#   puts
# end
    

#   puts ("-" * 60).center(80)
#   puts "Your Total Check: "
#   puts ("-" * 60).center(80)