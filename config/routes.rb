Rails.application.routes.draw do

<<<<<<< HEAD
  devise_for :students#, :controllers => { :registrations => "students/resgistration"}
=======
  devise_for :students
>>>>>>> 3968e280ed5cd3d6d1f2e9b52f355d1b0e53c752
  get "tools", to: "tools#index"

  get "control", to: "lends#index"
  resources :lends
  #root 'students#index'
  #resources :students
  root  'tools#index'
  resources :tools

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
