Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
 warp_resources :users, :user_sessions, :sessions
  
  namespace :api do
    namespace :v1 do
      post 'users/login', to: 'users#login'
      post 'users/signup', to: 'users#create'
      get 'users', to: 'users#index'
      get 'users/:username/friends', to: 'users#friends'
    end
  end

end
