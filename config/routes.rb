Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    resources :doctors, only: [:index]
    namespace :v1 do
      resources :reservations, only: [:index, :create, :show, :update, :destroy]
    end
  end
end
