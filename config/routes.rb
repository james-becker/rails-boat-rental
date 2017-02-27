Rails.application.routes.draw do
  get 'reviews/index'

  get 'reviews/new'

  get 'reviews/create'

  get 'reservations/index'

  get 'reservations/show'

  get 'reservations/edit'

  get 'reservations/destroy'

  get 'reservations/update'

  get 'reservations/new'

  get 'reservations/create'

  get 'boats/index'

  get 'boats/show'

  get 'boats/edit'

  get 'boats/destroy'

  get 'boats/update'

  get 'boats/new'

  get 'boats/create'

  get 'users/view_profile'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
