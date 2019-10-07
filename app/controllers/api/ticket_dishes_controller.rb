class Api::TicketDishesController < ApplicationController

  def index
    @ticket_dishes = TicketDish.all
    render 'index.json.jb'
  end

  def show
    @ticket_dish = ticket_dish.find(params[:id])
    render 'show.json.jb'
  end
end
