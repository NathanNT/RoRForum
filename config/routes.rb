Rails.application.routes.draw do
  resources :gossips do
  	resources :comments do
  		resources :commentlike
  	end
  	resources :gossiplike, only: [:create, :destroy]
  end
  resources :contact, only: [:index]
  resources :team, only: [:index]
  resources :user, only: [:show, :new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  get '/',to: 'static#index'

end
