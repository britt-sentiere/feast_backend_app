class Api::DishesController < ApplicationController

    def index
      # @dishes = Dish.find_by(params[:restaurant_id])
      @dishes = Dish.all
      render 'index.json.jb'
    end

    def show
      @dish = Dish.find(params[:id])
      render 'show.json.jb'
    end
end
