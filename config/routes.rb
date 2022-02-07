Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#home'
  get '/help',to: 'static_pages#help', as: 'help'
  get '/about',to: 'static_pages#about', as: 'about'
  get '/contacts',to: 'static_pages#contacts', as:'contacts'
  get '/signup', to: 'users#new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "application#hello"
end
 