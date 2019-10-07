class Api::DishesController < ApplicationController
    def index
      @dishes = Dish.all
      render 'index.json.jb'
    end

    def show
      @dish = dish.find(params[:id])
      render 'show.json.jb'
    end
end
