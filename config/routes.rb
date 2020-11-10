Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  resources :listings
  resources :profiles
end
