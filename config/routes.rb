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

  # Resources
  resources :comments
  resources :users
  resources :hilites, only: [:index, :new, :create, :show]

  # Nested Route
  resources :categories, only: [:index] do
    resources :hilites, only: [:index, :new, :create, :show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
