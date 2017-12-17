Rails.application.routes.draw do
  get 'wishlist/destroy'

  get 'wishlist/new'

  get 'wishlist/index'

  root to: "products#index"
  
  resources :addresses, except: [:show]
  resources :products, only: [:index, :show]
  resources :order_items, only: [:index, :create, :update, :destroy]
  resources :orders, only: [:index, :show, :new, :create]
  resources :wishlist, only: [:new, :destroy, :index]

  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    #omniauth_callbacks: 'users/omniauth_callbacks',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks'
  }

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
