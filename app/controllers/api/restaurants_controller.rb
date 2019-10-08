class Api::RestaurantsController < ApplicationController

  def index
    # response = HTTP['X-RapidAPI-Host': "us-restaurant-menus.p.rapidapi.com", 'X-RapidAPI-Key': "af3fb5beb8mshe060fab2244aa4ap1d1e9fjsnbe098ae6aecf"].get("https://us-restaurant-menus.p.rapidapi.com/restaurants/search/geo?page=1&lon=-87.634466&lat=41.892543&distance=.25")
    # unformatted_restaurants = response.parse["result"]["data"]
    # @restaurants =  []
    # unformatted_restaurants.each do |restaurant|
    #   Restaurant.create()
    #   #
    # end
    # @restaurants = Restaurant.all
    # @restaurants.each

    render 'index.json.jb'
  end

  # def create
  #   @restaurant = Restaurant.new(
  #                                 name: 
  #                                 address:
  #                                 cuisine:
  #                                 hours:
  #                                 )
  # end

  def show
    @restaurant = Restaurant.find(params[:id])
    render 'show.json.jb'
  end


end
