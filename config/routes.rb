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
            controller: 'clearance/users',
            only: Clearance.configuration.user_actions do
    resource :password,
             controller: 'clearance/passwords',
             only: %i[edit update]
  end

  resources :accounts, onoy: %i[new create edit update show]

  get 'register' => 'accounts#new', as: 'sign_up'
  get '/sign-in' => 'clearance/sessions#new', as: 'sign_in'
  delete '/sign-out' => 'clearance/sessions#destroy', as: 'sign_out'

  # Defines the root path route ("/")
  root 'pages#index'
end
