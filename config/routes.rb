Rails.application.routes.draw do
  devise_for :users
  resources :users
  get 'users/index'
  root 'users#index'
end
