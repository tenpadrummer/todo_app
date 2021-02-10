Rails.application.routes.draw do
  root 'tasks#index'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
end
