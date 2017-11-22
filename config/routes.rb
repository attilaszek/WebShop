Rails.application.routes.draw do
  resources :addresses, except: [:show]
  root to: "products#index"

  resources :products, only: [:index, :show]

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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
