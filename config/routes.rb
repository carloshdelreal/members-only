Rails.application.routes.draw do
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get '/profile', to: 'users#show'
  root 'sessions#new'

  resources :posts,     only: [:new, :create, :index]
  resources :users, only: [:new, :create, :show]

end
