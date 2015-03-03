Rails.application.routes.draw do


  get 'messages/new'

  get 'messages/create'

  # get 'profiles/show'

  get 'static_pages/home'

  # these are the user api routes
  root 'application#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  # GmailAlerts::Application.routes.draw do

  get 'messages/new'

  get 'messages/create'

  # get '/:id', to: 'profiles#show', as: 'profile'
  resources :users
  resources :profiles
  resources :friendships
  resources :account_activations, only: [:edit]
  resources :notifications, only: [:create, :destroy]
  resources :messages
  get '/deletemsg' => 'messages#destroy', as: :msgdelete

  #   root to: 'sessions#new'
  #   resources :sessions, only: :index
  #   get '/auth/:provider/callback' => 'sessions#create'
  # end

end
