Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do 
      resources :posts, only: [:index, :create]
      resources :users, only: [:create, :show]
      resources :boards, only: [:create, :show]
      resources :boardspost, only: [:create]

      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
      get '/logged_in', to: 'sessions#is_logged_in?'
    end
  end
end
