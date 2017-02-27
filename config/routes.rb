Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  root to: 'pages#home'

  devise_for :users, path_prefix: 'd'

  namespace :users do
      get '/:id/reservations', action: 'view_profile', as: "show_profile"
  end

  resources :boats do
    resources :reservations, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end

  resources :reservations, except: [:new, :create, :index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
