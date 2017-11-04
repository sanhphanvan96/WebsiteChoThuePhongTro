Rails.application.routes.draw do
  root to: "static#home"

  get "static/home"
  get "static/about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
