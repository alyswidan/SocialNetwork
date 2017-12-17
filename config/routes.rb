
Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  root 'users#new'

  get    'help'=> 'users#new'
  get    'home'=> 'users#new'
  get    'about'=> 'users#new'
  get    'contact' => 'users#new'
  get    'signup' => 'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users
  resources :posts
end