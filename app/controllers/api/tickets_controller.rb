class Api::TicketsController < ApplicationController

  def index
    @tickets = Ticket.all
    render 'index.json.jb'
  end

  def show
    @ticket = ticket.find(params[:id])
    render 'show.json.jb'
  end
end

