Rails.application.routes.draw do
  # Write Custom Routes Here
  # Home Page
  root 'sessions#home'

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

  # Resources
  resources :users, only: [:new, :create, :show]

  # Nested Route
  resources :categories, only: [:index] do
    resources :hilites, only: [:index, :new, :create, :show, :edit]
  end

  resources :users, only: [:show] do 
    resources :hilites, only: [:index, :new, :create, :edit, :destroy]
  end

  resources :hilites do
    resources :comments, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
