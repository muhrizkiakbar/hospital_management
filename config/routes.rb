Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    authenticated :user do
      root "users#show_profile", as: "show_profile_authed"
    end

    unauthenticated do
      root to: "devise/sessions#new"
    end
    
  end
  
  resources :permissions
  resources :roles, except: [:show] do
    resources :role_permissions, only: [:index, :create]
  end

  resources :departments
  
  scope "/manage" do
    resources :users
    get "/user/show_profile" => "users#show_profile", as: "show_profile"
    get "/user/edit_profile" => "users#edit_profile", as: "edit_profile"
    patch "/user/edit_profile" => "users#update_profile", as: "update_profile"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
