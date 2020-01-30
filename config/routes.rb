Rails.application.routes.draw do
  root "products#new"
  # get "/list", to: "products#list"
  resources :products

  get '/home', to: "products#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
