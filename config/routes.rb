Rails.application.routes.draw do
  resources :order_histories
  resources :orders
  resources :items
  resources :menus
  resources :order_items
  devise_for :users
  
  root to: "menus#index"
  post 'update_cart/:id', to: 'orders#update_cart', as: 'update_cart'


  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end
