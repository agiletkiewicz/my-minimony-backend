Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do 
      resources :posts, only: [:index, :create, :destroy] do 
        resources :boards, only: [:index]
      end
      resources :users, only: [:create, :show] do 
        resources :posts, only: [:index]
      end
      resources :boards, only: [:create, :show, :index, :destroy]
      resources :boardspost, only: [:create, :destroy]
      resources :follows, only: [:create, :destroy]

      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
      get '/logged_in', to: 'sessions#is_logged_in?'
    end
  end
end
