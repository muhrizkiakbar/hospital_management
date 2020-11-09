Rails.application.routes.draw do
  devise_for :users

  
  # resources :permissions
  resources :roles, except: [:show] do
    resources :role_permissions, only: [:index, :create]
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
