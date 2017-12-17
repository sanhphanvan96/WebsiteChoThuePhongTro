Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :posts
  devise_for :users
  root to: "posts#index"
  # root to: "static#home"

  get "users", to: redirect("home")
  get "home", to: "static#home"
  get "about", to: "static#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
