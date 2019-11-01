Rails.application.routes.draw do
  resources :gossips do
  	resources :comments
  end
  resources :contact, only: [:index]
  resources :team, only: [:index]
  resources :user, only: [:show, :new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :like, only: [:create]
end
