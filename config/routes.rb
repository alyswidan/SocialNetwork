
Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

<<<<<<< HEAD
  root 'static_pages#home'

  get    'help'=> 'static_pages#help'
  get    'home'=> 'static_pages#home'
  get    'about'=> 'static_pages#about'
  get    'contact' => 'static_pages#contact'
=======
  root 'users#new'

  get    'help'=> 'users#new'
  get    'home'=> 'users#new'
  get    'about'=> 'users#new'
  get    'contact' => 'users#new'
>>>>>>> user_profile
  get    'signup' => 'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users
  resources :posts
end