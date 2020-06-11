Rails.application.routes.draw do

  devise_for :users
  resources :movies
  resources :comments
  resources :posts, only: [:create, :new, :show]
  resources :feeds, only: [:index]
  resources :genres, only: [:index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
