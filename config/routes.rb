Rails.application.routes.draw do
  devise_for :users
  resources :cart_items
  resources :order_items
  resources :orders
  resources :carts
  resources :items
  resources :users
  resources :charges
  resources :contacts, only: [:new, :create]
  root to: "items#index"
end
