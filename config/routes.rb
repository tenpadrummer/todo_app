Rails.application.routes.draw do
  root 'tasks#index'
  resources :users, except: [:index, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :tasks, except: [:index]
  resources :projects, except: [:index, :show]
end
