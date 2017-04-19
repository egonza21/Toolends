Rails.application.routes.draw do


  get "tools", to: "tools#index"

  get "control", to: "lends#index"
  resources :lends
  root 'students#index'
  resources :students
  resources :tools

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
