Rails.application.routes.draw do
  root "sessions#login"

  get "/login", to: "sessions#login"

  post "/login", to: "sessions#login"

  delete "/logout", to: "sessions#destroy"

  get "/signup", to: "users#new"

  post "/signup", to: "users#create"
  # user routes
  resources :users, only: [:create]

  # product routes
  resources :products

  # warehouse routes
  resources :warehouses do 
    resources :products
  end

end
