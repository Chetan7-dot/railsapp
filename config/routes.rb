Rails.application.routes.draw do

  resources :products
  get 'home/index'
  devise_for :users
  root to: "home#index"
  resources :categories
  resources :orders
    post 'orders/:product_id', to: 'orders#create'
      
  resources :carts
  resources :carts do 
    post 'add_to_cart/:product_id', to: 'carts#add_to_cart', as: 'add_to_cart'
    post 'remove_from_cart/item_id', to: 'carts#remove_from_cart', as: 'remove_from_cart'
  end
end
