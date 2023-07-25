Rails.application.routes.draw do
  namespace :api do
    resources :doctors, only: [:index, :destroy]
    resources :reservations, only: [:index]
  end 
end
