Rails.application.routes.draw do
  
  get 'actor_videos/destroy'
  get 'actor_photos/destroy'
  #get 'actors/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'managers#index'
  #root 'messages#index'
  root 'dashboard#index'

  get 'users/new'
  get 'login', to: 'dashboard#login'
  get 'signin', to: 'sessions#new'
  get 'signup', to: 'users#new'
  get 'logout', to: 'sessions#destroy'

  get 'managers/index', to: 'managers#index'
  get 'actors/index', to: 'actors#index'
  get 'characters/index', to: 'characters#index'

  #post 'actors/send_confirmation', to: 'actors#send_confirmation'
  #post 'actors/cancel_confirmation', to: 'actors#cancel_confirmation'
  #post 'actors/approve_confirmation', to: 'actors#approve_confirmation'
  post 'actors/update_confirmation', to: 'actors#update_confirmation'

  resources :sessions, only: [:create]
  resources :users, only: [:new, :create]
  resources :resumes, only: [:new, :create, :edit, :destroy, :update]
  resources :actors, only: [:new, :create, :edit, :destroy, :update]
  resources :managers, only: [:new, :create, :edit, :destroy, :update]
  resources :characters, only: [:new, :create, :edit, :destroy, :update]
  resources :messages
  resources :actor_videos
  resources :actor_photos
end
