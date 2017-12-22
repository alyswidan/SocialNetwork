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
  resources :users do
    member do
      get :buddies
    end
  end

  resources :posts,      only: [:create, :destroy]
  resources :friends,    only:[:create, :destroy]
  resources :friend_requests,    only:[:create, :destroy]
end