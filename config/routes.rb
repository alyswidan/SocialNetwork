Rails.application.routes.draw do
  
  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'

  get    'help' => 'static_pages#help'
  get    'home' => 'static_pages#home'
  get    'about' => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup' => 'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
<<<<<<< HEAD
  resources :users do
    member do
      get :likes
    end
  end
  resources :posts, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]

=======
  get 'advanced_search' => 'advanced_searches#new'
  post 'advanced_search' => 'advanced_searches#create'
  get 'advanced_search/results' => 'advanced_searches#results'
  resources :users
  resources :posts, only: %i[create destroy]
>>>>>>> master
end