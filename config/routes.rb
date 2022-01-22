Rails.application.routes.draw do
  
  root 'products#index'

  # product routes
  resources :products, only: [:index, :show, :new, :create, :edit, :update]

  delete '/products/:id', to: 'products#destroy'

  # warehouse routes
  resources :warehouses, only: [:index, :show]
end
