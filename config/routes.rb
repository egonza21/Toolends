Rails.application.routes.draw do

  #devise_for :students#, :controllers => { :registrations => "students/resgistration"}

  devise_for :students

  devise_scope :student do
    authenticated :student do
      root 'lists#index', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  get "lists", to: "lists#index"

  get "tools", to: "tools#index"

  get "control", to: "lends#index"

  post "student_name", to: "lends#find_student"

  resources :lends
  #root 'students#index'
  #resources :students
  #root  'lists#index'

  resources :tools

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
