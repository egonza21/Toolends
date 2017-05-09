Rails.application.routes.draw do

  #devise_for :students#, :controllers => { :registrations => "students/resgistration"}

  devise_for :students
  get "lists", to: "lists#index"
  get "tools", to: "tools#index"

  get "control", to: "lends#index"
  resources :lends
  #root 'students#index'
  #resources :students
  root  'tools#index'
  resources :tools

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
