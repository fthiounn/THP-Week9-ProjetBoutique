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
  root to: "items#index"
end
