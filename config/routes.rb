Rails.application.routes.draw do

  devise_for :users
  resources :movies
  resources :posts do 
    resources :comments, only: [:new, :create]
  end
  resources :mentions, only: [:index]
  resources :feeds, only: [:index]
  resources :genres, only: [:index]
  resources :users, only: [:show] do
    member do
      post :follow
      post :unfollow
    end
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
