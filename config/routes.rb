Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  root to: 'pages#home'

  devise_for :users, path_prefix: 'd', controllers: { registrations: "registrations", omniauth_callbacks: 'users/omniauth_callbacks' }
  # devise_for :users, controllers: { registrations: "registrations" }

  namespace :users do
      get '/:id/profile', action: 'view_profile', as: "show_profile"
  end

  resources :boats do
    resources :reservations, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  get "/search_boat/", to: "boats#search", as: "search_boat"
  resources :reservations, except: [:new, :create, :index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
