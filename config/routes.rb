Rails.application.routes.draw do
  # Write Custom Routes Here
  # Home Page
  root 'static#home'

  # Signup
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  # Signout
  delete '/signout' => 'sessions#destroy'

  # Signin
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  # Google Auth
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  # Nested Route
  resources :categories, only: [:index, :new, :create] do
    resources :hilites, only: [:index, :new, :create]
  end

  resources :users, only: [:new, :create, :show] do
    resources :hilites, only: [:index, :new, :create, :edit, :destroy]
  end

  resources :hilites do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
