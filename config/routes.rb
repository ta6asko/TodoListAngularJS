Rails.application.routes.draw do

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } 
  
  namespace :api do
    resources :projects, only: [:index, :create, :update, :destroy] do
      resources :tasks, only: [:create, :update, :destroy] 
    end

    resources :tasks, only: [] do
      resources :comments, only: [:create, :destroy] 
    end

    resources :comments, only: [] do
      resources :supplements, only: [:create, :destroy]
    end 
  end

  root 'main#index'
  get 'omniauth_callbacks/facebook'


end
