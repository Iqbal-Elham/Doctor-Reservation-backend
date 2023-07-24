Rails.application.routes.draw do
  namespace :api do
    get 'doctors', to: 'doctors#index'
    resources :reservations, only: [:index]
  end 
end
