Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "pages#index"
  get '/about', to: 'pages#about', as: :about

  resources :users, expect: [:destroy] do
    collection do
      get :sign_in
    end
  end
  resource :sessions, only: [:create, :destroy]

  resources :posts do
    resources :books, shallow: true, only: [:create, :destroy]
    resources :comments, shallow: true, only: [:create, :destroy]
  end

  namespace :api do
    namespace :v1 do
      resources :post, only: [] do
        member do
          patch :like
          patch :store
        end
      end
    end
  end

end
