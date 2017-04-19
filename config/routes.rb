Rails.application.routes.draw do
  get 'tools/index'

  get 'control/index'
  root 'students#index'
  resources :students
  resources :tools

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
