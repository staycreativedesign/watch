Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  resources :passwords,
            controller: 'clearance/passwords',
            only: %i[create new]

  resource :session,
           controller: 'sessions',
           only: [:create]

  resources :accounts,
            controller: 'accounts',
            only: Clearance.configuration.user_actions do
    resource :password,
             controller: 'clearance/passwords',
             only: %i[edit update]

    # initial setup -------------------------
    resource :email_verification,
             controller: 'accounts/setup/email_verification',
             only: %i[update]
    resource :company,
             controller: 'accounts/setup/company',
             only: %i[new create edit update]
    resource :inventory,
             controller: 'accounts/setup/inventory',
             only: %i[show]
    resource :finalize,
             controller: 'accounts/setup/finalize',
             only: %i[show]
    # initial setup -------------------------
  end

  resource :addresses do
    collection do
      get :states
      get :cities
    end
  end

  resource :dashboard,
           controller: 'accounts/dashboard',
           only: %i[show]

  resource :validations, only: %i[create update]

  resources :accounts, onoy: %i[new create edit update show]

  get '/register' => 'accounts#new', as: 'sign_up'
  get '/login' => 'clearance/sessions#new', as: 'sign_in'
  delete '/sign-out' => 'clearance/sessions#destroy', as: 'sign_out'

  # Defines the root path route ("/")
  root 'pages#index'
end
