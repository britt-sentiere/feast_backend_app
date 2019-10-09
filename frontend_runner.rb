class FeastClient

  require 'http'


  def display_main_menu
    system "clear"

      puts "=" * 80
      puts "Feast App".center(80)
      puts "=" * 80
      puts ""

      puts "Main Menu"
      puts "-" * 80
      puts
      puts "   [1] All Restaurants"
      puts "   [2] View A Restaurant"
      # puts "   [1] Dish Index"
      # puts "   [2] Dish Show"
      puts 

      print "Pick an option: "
      user_selection = gets.chomp
      puts
      main_menu_response(user_selection)
  
  end

  def main_menu_response(user_selection)
    if user_selection == "1"
      show_restaurants
    elsif user_selection == "2"
      choose_restaurant
    end
  end

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
    choose_restaurant
  end

  def choose_restaurant
    puts "Please select a restaurant(by id number): "
    puts
    puts "Return to main menu by inputting 'exit'"
    response = gets.chomp
    
    if response == "exit"
      display_main_menu
    else 
      show_restaurant(response.to_i) 
    end 
  end

  def show_restaurant(restaurant_id)
    response = HTTP.get("http://localhost:3000/api/restaurants/#{restaurant_id}")
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

      # return to main menu 
    end
  end

  def add_to_ticket
    # add one dish at a time to an order
    # dishes_response(put in if statement)
  end

  def show_ticket
    # show all dishes and total price so far
    # should also return to show_dishes OR reserve
    # dishes_response (put in if statement)
  end

  def reserve
    # show all dishes and total price
    # incorporate twilio here
    # show_ticket
  end

  def display_dishes_options
    # when in the dishes menu
    # displays add to ticket option, show ticket option, and reserve option 
    # set user_selection = gets.chomp (translate to to_i)
    # display main menu here as well
  end

  def dishes_response(user_selection)
    # based on user selection (number) run add to ticket, show ticket, or reserve
  end

  # always make sure it gives options to go back to another view 


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
#     puts "restaurant_id: #{dish["restaurant_id"]}"
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

