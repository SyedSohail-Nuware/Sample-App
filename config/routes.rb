Rails.application.routes.draw do
  root 'static_pages#home'
  # resources :users
  get 'sessions/new'
  get 'users/new'
  get '/help',to: 'static_pages#help', as: 'help'
  get '/about',to: 'static_pages#about', as: 'about'
  get '/contacts',to: 'static_pages#contacts', as:'contacts'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login',to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  delete '/user/:id/delete', to: 'users#delete_user'
  get '/user/:id/delete', to: 'users#delete_user'

  resources :users do
    member do
    get :following, :followers
    end
  end

  resources :microposts,only: [:create, :destroy]
  resources :relationships,only: [:create, :destroy]

end
 

# delete 'articles/:id/delete' => 'articles#destroy', as: 'articles_delete'
# get '/articles/:id/delete' => 'articles#destroy'