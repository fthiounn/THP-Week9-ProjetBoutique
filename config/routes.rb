Rails.application.routes.draw do
  resources :cities
  devise_for :users
  resources :order_items
  resources :orders
  resources :carts
  resources :items do
    resources :cart_items
    post 'search',  :on => :collection
  end
  resources :users
  resources :charges
  resources :contacts, only: [:new, :create]
  resources :teams, only: [:new]
  root to: "items#index"

  namespace :admin do
    resources :users
    resources :items
    resources :orders
  end
end
