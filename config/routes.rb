Rails.application.routes.draw do
  get 'homes/index'
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }
  
  get 'hello/index' => 'hello#index'

  resources :users, only: [:show]
  
  get'blogs/index'
  resources :blogs
  
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end

  post 'callback' => 'line_bot#callback'

  root 'hello#index'


end
