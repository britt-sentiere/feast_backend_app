require 'twilio-ruby'

account_sid = 'ACaec65283ab4b6f5470647a871aeb69bf'
auth_token = 'debd1769b32f1c9991ac84721884baf3'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+19382382992' # Your Twilio number
to = '+18477222748' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)