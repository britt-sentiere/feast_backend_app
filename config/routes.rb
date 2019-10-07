Rails.application.routes.draw do
  namespace :api do
    get '/restaurants' => 'restaurants#index'
    post '/restaurants/' => 'restaurants#create'
    get '/restaurants/:id' => 'restaurants#show'
  end
end
