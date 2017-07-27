Rails.application.routes.draw do
  get 'sessions/new'

  resources :users
  get 'home/index'
  root "home#index"
  get "/auth_g", to: "home#auth_g", as: "auth_g"
  get "/redirect", to: "home#redirect", as: "redirect"

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
