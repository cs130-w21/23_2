Rails.application.routes.draw do
 
  resources :cities, only: [:index]
  devise_for :users
  devise_scope :user do
    
    authenticated :user do
      root :to => 'pages#home'
      
    end
    unauthenticated :user do
      root :to => 'devise/registrations#new', as: :unauthenticated_root
    end
  end
  resources :users do
    resource :profile
    
  end
    
  resources :chatrooms do
    resource :requests
    resource :chatroom_users
    resources :messages
  end

  get '/search' => 'pages#search', :as => 'search_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

