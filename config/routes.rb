Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :gatherings
  resources :blogs
  resources :partners
  resources :teams

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
