Rails.application.routes.draw do
  namespace :carts do
    resources :calculate_products_price, only: :index
  end
end
