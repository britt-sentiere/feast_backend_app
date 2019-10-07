require 'rubygems' 
require 'twilio-ruby' 


   
account_sid = 'ACaec65283ab4b6f5470647a871aeb69bf' 
auth_token = 'debd1769b32f1c9991ac84721884baf3' 
@client = Twilio::REST::Client.new(account_sid, auth_token) 
 
message = @client.messages.create(  
                             from: '+19382382992',       
                             to: '+mynumber',
                             body: "You're all set. Table for 2 on Saturday, October 12, 2019 at 8:00 pm"
                           ) 
 
puts message.sid