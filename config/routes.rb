Rails.application.routes.draw do
  root 'static_pages#home'
  get 'sessions/new'
  get 'users/new'
  get '/help',to: 'static_pages#help', as: 'help'
  get '/about',to: 'static_pages#about', as: 'about'
  get '/contacts',to: 'static_pages#contacts', as:'contacts'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login',to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users

end
 