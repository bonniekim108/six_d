Rails.application.routes.draw do


  # these are the user api routes
  root 'application#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  # GmailAlerts::Application.routes.draw do
  #   root to: 'sessions#new'
  #   resources :sessions, only: :index
  #   get '/auth/:provider/callback' => 'sessions#create'
  # end

end
