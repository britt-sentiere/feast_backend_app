Rails.application.routes.draw do
 namespace :api do
  get '/users' => 'users#index'
  get '/users/:id' => 'users#show'

  get '/tickets' => 'tickets#index'
  get '/tickets/:id' => 'tickets#show'

  get '/ticket_dishes' => 'ticket_dishes#index'
  get '/ticket_dishes/:id' => 'ticket_dishes#show'

  get '/dishes' => 'dishes#index'
  get '/dishes/:id' => 'dishes#show'
 end 
end

