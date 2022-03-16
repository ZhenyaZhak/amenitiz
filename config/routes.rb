Rails.application.routes.draw do
  root 'market#index'
  resources :market, only: :index
  resources :orders, only: [ :create, :show ]
  namespace :carts do
    resources :calculate_products_price, only: :index
  end
end
