Rails.application.routes.draw do
  # resources :users, only: [:create]
  # post '/login', to: 'sessions#create'

  get '/users/:username', to: 'users#show'
  post '/users/:username', to: 'users#show'
  post '/users', to: 'users#create'
  delete '/users/:username', to: 'users#destroy'

  namespace :api do
    resources :doctors, only: [:index, :show, :destroy]
    resources :reservations
  end 
end
