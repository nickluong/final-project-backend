Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get 'users/login'
      post 'users/signup'
      get '/test', to: 'user#test'
      get 'users/:id', to: 'user#friends'
      get 'users', to: 'user#index'
    end
  end

end
