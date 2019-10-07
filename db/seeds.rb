# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

response = HTTP['X-RapidAPI-Host': "us-restaurant-menus.p.rapidapi.com", 'X-RapidAPI-Key': "af3fb5beb8mshe060fab2244aa4ap1d1e9fjsnbe098ae6aecf"].get("https://us-restaurant-menus.p.rapidapi.com/restaurants/search/geo?page=1&lon=-87.634466&lat=41.892543&distance=.25")
unformatted_restaurants = response.parse["result"]["data"]
unformatted_restaurants.each do |restaurant|
  Restaurant.create(restaurant.) # have to make Restaurant, only adding restaurant attributes. Can add dishes to restaurant after this. 
  #
end
@restaurants = Restaurant.all
@restaurants.each