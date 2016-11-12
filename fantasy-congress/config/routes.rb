Rails.application.routes.draw do
  resources :leagues
  get 'home/index'
  root 'home#index'
  
  resources :users
  resources :politicians
  resources :matches
  resources :leagues 
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
