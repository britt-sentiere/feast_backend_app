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

  def update
    @ticket = Ticket.find(params[:id]) || @ticket.id
    @ticket.restaurant_id = params[:restaurant_id] || @ticket.restaurant_id
    @ticket.user_id = params[:user_id] || @ticket.user_id
    @ticket.total_check = params[:total_check] || @ticket.total_check
    @ticket.status = params[:status] || @ticket.status

# route and action SMS message inside ticket
# render success message
  end

  def sms_text
     
    
    client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']) 
     
    message = client.messages.create(  
                                 from: '+19382382992',       
                                 to: '+18477222748',
                                 body: "You're all set. Table for 2 on Saturday, October 12, 2019 at 8:00 pm"
                               ) 
     
    puts message.sid

    render json: { message: "success"}
  end
end



# update
# submit reservation, changes status to submitted
# if submitted, status and price are changed to 
