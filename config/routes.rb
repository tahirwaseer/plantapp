Rails.application.routes.draw do
  resources :material_requirements
  resources :plants
  devise_scope :user do
      authenticated  do
        root to: 'visitors#index'
      end

      unauthenticated do
        root to: 'devise/sessions#new', as: 'unauthenticated_root'
      end
    end  


  # root to: 'visitors#index'
  devise_for :users
  resources :users
end
