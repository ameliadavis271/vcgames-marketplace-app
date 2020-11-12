Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "homes#index"
  resources :listings
  resources :profiles
end
