Rails.application.routes.draw do

  root "products#new"
  get 'home', to: "products#home"
  resources :products
  # get '/list', to: "products#list"

  resources :users
  get 'signup', to: "users#new"
  # okay nvm

  get 'login', to:"sessions#new"
  post 'login', to:"sessions#create"
  delete 'login', to:"sessions#delete"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
