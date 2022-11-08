Rails.application.routes.draw do
  devise_for :users, controllers: { session: 'users/sessions', registrations: 'users/registrations'}
  root 'matches#index'

  get '/get_token', to: 'application#get_token'
  post '/authorize_request', to: 'application#authorize_request'
  
  authenticated :user do
    resources :teams
    resources :matches
    resources :pools
    resources :users
    root to: redirect("/matches"), as: :home
  end

  unauthenticated :user do
    root to: redirect("/users/sign_in"), as: :login
  end

  resources :users do
    member do
      post :send_email
    end
  end

  namespace :api do
    namespace :v1 do
      resources :matches 
      resources :users
      resources :pools
      resources :teams
    end
  end

  namespace :api do
    namespace :v2 do
      resources :teams 
    end
  end
end