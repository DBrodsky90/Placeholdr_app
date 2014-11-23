Rails.application.routes.draw do
  root 'sessions#new'


  resources :users
  resources :boards do
  	member do
  		put 'add_image'
  		put 'remove_image'
  	end
  end
  resources :images, except: [:edit, :update, :new]

  get 'home/index' => 'home#index', as: 'home'

  get 'sessions/new' => 'sessions#new', as: 'login'
  post 'sessions'    => 'sessions#create'
  delete 'sessions'  => 'sessions#destroy'
  
end
