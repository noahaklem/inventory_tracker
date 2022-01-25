Rails.application.routes.draw do

  root 'warehouses#index'

  # user routes
  resources :users, only: [:new]
  # product routes
  resources :products
  # warehouse routes
  resources :warehouses, only: [:new, :create, :index, :edit, :update, :destroy] do 
    resources :products
  end
end
