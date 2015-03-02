Rails.application.routes.draw do


  get 'profiles/show'

  get 'static_pages/home'

  # these are the user api routes
  root 'application#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  # GmailAlerts::Application.routes.draw do

  get '/:id', to: 'profiles#show', as: 'profile'
  resources :friendships
  resources :account_activations, only: [:edit]
  

  #   root to: 'sessions#new'
  #   resources :sessions, only: :index
  #   get '/auth/:provider/callback' => 'sessions#create'
  # end

end
