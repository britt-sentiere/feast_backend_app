class Api::RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    

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
