Rails.application.routes.draw do
  resources :jobs, only: [:search, :show]
  resources :users, only: [:show]
  root 'jobs#search'
end
