
Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  root 'static_page#home'

  get    'help'=> 'static_page#help'
  get    'home'=> 'static_page#home'
  get    'about'=> 'static_page#about'
  get    'contact' => 'static_page#contact'
  get    'signup' => 'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users
  resources :posts
end