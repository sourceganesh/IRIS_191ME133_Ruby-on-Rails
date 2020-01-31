Rails.application.routes.draw do
  root "products#new"
  # get "/list", to: "products#list"
  get '/home', to: "products#home"
  resources :products
  resources :users
  get '/signup', to: "users#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
