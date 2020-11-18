# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'homes#index'
  resources :listings
  resources :profiles
  resources :conversations, only: %i[index show]
  resources :personal_messages, only: %i[new create]
  resources :payments, only: [:create]
  get 'payments/success', to: 'payments#success'
  get 'payments/cancel', to: 'payments#cancel'
  post '/payments/webhook', to: 'payments#webhook'
end
