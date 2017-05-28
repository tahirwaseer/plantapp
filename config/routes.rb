Rails.application.routes.draw do
  namespace :admin do
    get 'dashboard/index'
  end

  get '/admin', to: "admin/dashboard#index"
  # namespace :admin do
  #   resources :dashboard
  # end

  resources :material_requirements
  resources :plants do
    collection do 
      get :region_plants
      post :assign_plants
      post :remove_plants
      get :user_plants
    end
  end
  
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
