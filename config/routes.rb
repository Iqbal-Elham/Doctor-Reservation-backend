Rails.application.routes.draw do
  namespace :api do
    get 'doctors', to: 'doctors#index'
  end 
end
