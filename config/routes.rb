Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  get '/users/:username', to: 'users#show'
  post '/users/:username', to: 'users#show'
  post '/users', to: 'users#create'
  delete '/users/:username', to: 'users#destroy'

  namespace :api do
    resources :doctors, only: [:index, :show, :destroy, :create]
    resources :reservations
  end 
end
