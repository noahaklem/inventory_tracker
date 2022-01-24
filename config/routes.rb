Rails.application.routes.draw do

  root 'warehouses#index'

  # user routes
  resources :users, only: [:new]
  # product routes
  resources :products
  # warehouse routes
  resources :warehouses do 
    resources :products, only: [:index, :show, :new, :create, :edit, :update, :delete]
  end
end
