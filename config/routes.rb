Rails.application.routes.draw do
  resources :jobs, only: [:search, :index]
  resources :users, only: [:show]
  root 'jobs#search'
end
