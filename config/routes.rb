Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "homes#index"
  resources :listings
  resources :profiles
  resources :conversations, only: [:index, :show]
  resources :personal_messages, only: [:new, :create]

  get "payments/success", to: "payments#success"
  post "checkout", to: "payments#checkout"
end
