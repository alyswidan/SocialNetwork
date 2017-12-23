Rails.application.routes.draw do
  root 'static_pages#home'

  get    'help' => 'static_pages#help'
  get    'home' => 'static_pages#home'
  get    'about' => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup' => 'users#new'

  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'advanced_search' => 'advanced_searches#new'
  post 'advanced_search' => 'advanced_searches#create'
  get 'advanced_search/results' => 'advanced_searches#results'
  
  resources :posts, only: %i[create destroy]
  resources :likes, only: %i[create destroy]
  resources :friends, only:%i[create destroy]
  resources :friend_requests, only: %i[create destroy]


  resources :users do
    member do
      get :likes
      get :buddies
      get :about
      get :received_requests
    end
  end


  
end