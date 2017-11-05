Rails.application.routes.draw do
  devise_for :users
  root to: "static#home"

  get "users", to: "static#home"
  get "home", to: "static#home"
  get "about", to: "static#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
