Rails.application.routes.draw do
  
  resources :users
  root 'products#index'

  # product routes
  resources :products, only: [:index, :show, :new, :create, :edit, :update, :delete]

  # warehouse routes
  resources :warehouses, only: [:index, :show] do 
    resources :products, only: [:index, :show]
  end
end
