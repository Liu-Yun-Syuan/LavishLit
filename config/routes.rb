Rails.application.routes.draw do
  root "pages#index"
  get '/about', to: 'pages#about', as: :about
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")

  devise_for :users, path: '', controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }, path_names: {
    sign_in: 'log_in',
    edit: 'edit/profile'
  }, singular: :user
  get '(/:unique_id)', to: 'users#show', as: :user, via: :get
  # singular: set up the singular name for the given resource. This is used as the helper methods names in controller ("authenticate_#{singular}!", "#{singular}_signed_in?", "current_#{singular}" and "#{singular}_session"), as the scope name in routes and as the scope given to warden.

  devise_scope :user do
    # resources :profiles, param: :username, only: [:show, :update, :destroy], path: '', as: :profile, shallow: true
  end

  resources  :posts, :books, :films, :pictures do
    resources :comments, shallow: true, only: [:create, :destroy]
  end

  namespace :api do
    namespace :v1 do
      resources :posts, :books, :films, :pictures, only: [] do
        member do
          patch :like
          patch :store
        end
      end
    end
  end

end
