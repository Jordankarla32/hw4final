Rails.application.routes.draw do
  resources :places do
    resources :entries, only: [:new, :create, :show, :destroy]
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  # Authentication Routes
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"  # ✅ Match the example project

  # Root Path
  root "sessions#new"
end

