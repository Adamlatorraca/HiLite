Rails.application.routes.draw do
  # Write Custom Routes Here
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  resources :categories
  resources :comments
  resources :users
  resources :hilites
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
