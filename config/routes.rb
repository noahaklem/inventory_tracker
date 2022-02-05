Rails.application.routes.draw do
  root "sessions#new"

  get "/login", to: "sessions#new"

  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  get "/signup", to: "users#new"

  post "/signup", to: "users#create"
  
  get "/auth/:provider/callback", to: "sessions#omniauth"

  # user routes
  resources :users, only: [:create]

  # product routes
  get "/all-products", to: "products#index", as: "products"
  post "/all-products", to: "products#create"
  
  resources :products, only: [:new, :create, :edit, :update, :destroy]
  
  # warehouse routes

  resources :warehouses do 
    resources :products
  end

end
