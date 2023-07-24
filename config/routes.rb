Rails.application.routes.draw do
  namespace :api do
    get 'doctors', to: 'doctors#index'
    get 'doctor/delete', to: 'doctors#destroy'
  end 
end
