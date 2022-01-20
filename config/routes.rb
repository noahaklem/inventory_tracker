Rails.application.routes.draw do
  
  root 'products#index'

  # product routes
  resources :products, only: [:index, :show, :new, :create, :edit, :update]

  # warehouse routes
  resources :warehouses
end
