Rails.application.routes.draw do
  resources :gossips do
  	resources :comments do
  		resources :commentlike, only: [:create]
  	end
  	resources :gossiplike, only: [:create]
  end
  resources :contact, only: [:index]
  resources :team, only: [:index]
  resources :user, only: [:show, :new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  
end
