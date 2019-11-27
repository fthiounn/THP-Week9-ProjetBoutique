Rails.application.routes.draw do
  devise_for :users
  resources :cart_items
  resources :order_items
  resources :orders
  resources :carts
  resources :items do
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
  end
end
