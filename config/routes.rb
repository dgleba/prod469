Rails.application.routes.draw do
 
  resources :elist_reports
  resources :elists
  resources :reports
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :roles
 
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # devise_for :users
  

  root "home#index"
  get 'home/index'

   
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
