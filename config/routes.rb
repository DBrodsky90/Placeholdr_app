Rails.application.routes.draw do
  root 'splash#index'

  resources :users
  resources :boards
  resources :images, except: [:edit, :update]


  get 'sessions/new' => 'sessions#new', as: 'login'
  post 'sessions'    => 'sessions#create'
  delete 'sessions'  => 'sessions#destroy'
  
end
