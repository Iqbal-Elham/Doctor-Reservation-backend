Rails.application.routes.draw do
  namespace :api do
    resources :doctors, only: [:index, :destroy]
  end 
end
