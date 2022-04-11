Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "users", to: "devise/sessions#new"
  end
  resources :profiles
  resources :catches
  root 'home#index'
  get '/about', to: 'home#about'
  get '/winter', to: 'home#winter'
  get '/summer', to: 'home#summer'
end
