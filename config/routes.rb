Rails.application.routes.draw do


  root 'application#index'
  
  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  # allows this to be referred to as profile path in views
  get 'profile/:id', to: 'profiles#show', as: 'profile'

  get 'messages/new'

  get 'messages/create'

  resources :users
  resources :profiles
  resources :friendships
  resources :account_activations, only: [:edit]
  resources :notifications, only: [:create, :destroy]
  resources :messages
  get '/deletemsg' => 'messages#destroy', as: :msgdelete

end
