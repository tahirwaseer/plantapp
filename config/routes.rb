Rails.application.routes.draw do
  namespace :admin do
    get 'dashboard/index'
  end

  namespace :admin do
    get 'dashboard/new'
  end

  namespace :admin do
    get 'dashboard/create'
  end

  namespace :admin do
    get 'dashboard/update'
  end

  namespace :admin do
    get 'dashboard/destroy'
  end

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
