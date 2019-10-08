Rails.application.routes.draw do
 namespace :api do
  get '/users' => 'users#index'
  get '/users/:id' => 'users#show'

  get '/tickets' => 'tickets#index'
  get '/tickets' => 'tickets#create'
  get '/tickets/:id' => 'tickets#show'
  patch '/tickets/:id' => 'tickets#update'

  get '/ticket_dishes' => 'ticket_dishes#index'
  get '/ticket_dishes/:id' => 'ticket_dishes#show'

  get '/dishes' => 'dishes#index'
  get '/dishes/:id' => 'dishes#show'

  get '/sms_text' => 'tickets#sms_text'
 end 
end

