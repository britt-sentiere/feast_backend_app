require 'rubygems' 
require 'twilio-ruby' 


   
account_sid = 'account_sid' 
auth_token = 'auth_token' 
@client = Twilio::REST::Client.new(account_sid, auth_token) 
 
message = @client.messages.create(  
                             from: '+19382382992',       
                             to: '+mynumber',
                             body: "You're all set. Table for 2 on Saturday, October 12, 2019 at 8:00 pm"
                           ) 
 
puts message.sid