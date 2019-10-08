require 'http'

system "clear"

puts "=" * 80
puts "Feast App".center(80)
puts "=" * 80
puts ""


puts "Main Menu"
puts "-" * 80
puts
puts "   [1] Dish Index"
puts "   [2] Dish Show"
puts 

print "Pick an option: "
user_selection = gets.chomp
puts 
puts

if user_selection == "1"
  response = HTTP.get("http://localhost:3000/api/dishes")

  dishes = response.parse

  puts "All Dishes"
  puts

  dishes.each do |dish|
    puts "id: #{dish["id"]}"
    puts "name: #{dish["name"]}"
    puts "currency: #{dish["currency"]}"
    puts "price: #{dish["price"]}"
    puts "description: #{dish["description"]}"
    puts "restaurant_id: #{dish["restaurant_id"]}"
    puts
    puts ("-" * 60).center(80)
  end
elsif user_selection == "2"
  print "what is the id of the dish you want to view? "
  dish_id = gets.chomp

  response = HTTP.get("http://localhost:3000/api/dishes/#{dish_id}")

  dish = response.parse

  puts
  puts "id: #{dish["id"]}"
  puts "name: #{dish["name"]}"
  puts "currency: #{dish["currency"]}"
  puts "price: #{dish["price"]}"
  puts "description: #{dish["description"]}"
  puts "restaurant_id: #{dish["restaurant_id"]}"
  puts
end
    

  puts "-" * 60.center(80)
  puts "Your Total Check: "
  puts "-" * 60.center(80)

  ticket_dish.each do |ticket|
    
  end 
