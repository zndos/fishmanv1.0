Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get '/about', to: 'home#about'
  get '/winter', to: 'home#winter'
  get '/summer', to: 'home#summer'
  resources :profiles
  resources :catches
end
