Rails.application.routes.draw do
  root "sessions#new"

  get "/login", to: "sessions#new"

  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  get "/signup", to: "users#new"

  post "/signup", to: "users#create"

  get "/auth/google_auth2/callback", to: "sessions#create"
  
  # user routes
  resources :users, only: [:create]

  # product routes
  resources :products

  # warehouse routes
  resources :warehouses do 
    resources :products
  end

end
