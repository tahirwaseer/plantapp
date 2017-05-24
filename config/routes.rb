Rails.application.routes.draw do
  resources :plants
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
