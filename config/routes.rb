Rails.application.routes.draw do

  resources :users
  resources :boards
  resources :images, except: [:edit, :update]

end
