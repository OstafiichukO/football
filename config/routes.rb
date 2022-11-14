Rails.application.routes.draw do
  devise_for :users
  # , controllers: { session: 'users/sessions', registrations: 'users/registrations'}
  # root 'matches#index'

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
      resources :matches, :users, :pools, :teams 
      get '/get_token', to: 'application_api#get_token'
      post '/authorize_request', to: 'application_api#authorize_request'
    end
  end
end