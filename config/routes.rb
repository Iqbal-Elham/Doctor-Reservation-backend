Rails.application.routes.draw do
  namespace :api do
    resources :doctors
    resources :reservations, only: [:index]
  end 
end
