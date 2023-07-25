Rails.application.routes.draw do
  resources :users, only: [:create]
  post '/login', to: 'sessions#create'
  
  namespace :api do
    get 'doctors', to: 'doctors#index'
    resources :reservations, only: [:index]
  end 
end
