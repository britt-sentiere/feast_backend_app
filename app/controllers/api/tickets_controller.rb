class Api::TicketsController < ApplicationController

  def index
    @tickets = Ticket.all
    render 'index.json.jb'
  end

  def create
    @ticket = Ticket.new
    @ticket.restaurant_id
    @ticket.user_id
    @ticket.total_check

    @ticket.save
  end


  def show
    @ticket = Ticket.find(params[:id])
    render 'show.json.jb'
  end
end


  def update
    @ticket = Ticket.find(params[:id]) || @ticket.id
    @ticket.restaurant_id = params[:restaurant_id] || @ticket.restaurant_id
    @ticket.user_id = params[:user_id] || @ticket.user_id
    @ticket.total_check = params[:total_check] || @ticket.total_check
    @ticket.status = params[:status] || @ticket.status
  end

# update
# submit reservation, changes status to submitted
# if submitted, status and price are changed to 