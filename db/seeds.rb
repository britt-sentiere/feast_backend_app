response = HTTP['X-RapidAPI-Host': "us-restaurant-menus.p.rapidapi.com", 'X-RapidAPI-Key': "#{ ENV['API_KEY'] }"].get("https://us-restaurant-menus.p.rapidapi.com/restaurants/search/geo?page=1&lon=-87.634466&lat=41.892543&distance=.25")
unformatted_restaurants = response.parse["result"]["data"]
unformatted_restaurants.each do |restaurant|
  Restaurant.create(
                    name: restaurant["restaurant_name"],
                    address: restaurant["address"]["formatted"],
                    cuisine: restaurant["cuisines"].join(", "),
                    hours: restaurant["hours"],
                    xyz_ref_num: restaurant["restaurant_id"]
                    )
end

@restaurants = Restaurant.all
xyz_ref_nums = []
@restaurants.each do |restaurant|
  xyz_ref_nums << restaurant.xyz_ref_num
end

xyz_ref_nums.each do |num|
  response = HTTP['X-RapidAPI-Host': "us-restaurant-menus.p.rapidapi.com", 'X-RapidAPI-Key': "#{ ENV['API_KEY'] }"].get("https://us-restaurant-menus.p.rapidapi.com/restaurant/#{num}/menuitems") 


  unformatted_dishes = response.parse["result"]["data"]
  @negative_one = "-1".to_i

  def mip_value(array)
    if array == []
      return @negative_one
    end
    return array[0]["price"]
  end

  unformatted_dishes.each do |dish|

    Dish.create(

                name: dish["menu_item_name"],
                price: mip_value(dish["menu_item_pricing"]),
                description: dish["menu_item_description"],
                restaurant_id: Restaurant.find_by(xyz_ref_num: dish["restaurant_id"]).id
                )
  end

end

