Rails.application.routes.draw do
  devise_for :users
  resources :cart_items
  resources :order_items
  resources :orders
  resources :carts
  resources :items
  resources :users
  resources :charges
  resources :contact
  root to: "items#index"
end
