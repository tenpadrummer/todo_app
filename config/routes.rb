Rails.application.routes.draw do
  root 'tasks#index'
  resources :users, except: %i[index show]
  resources :sessions, only: %i[new create destroy]
  resources :tasks, except: [:index]
  resources :projects, except: %i[index show]
end
