Rails.application.routes.draw do
  get 'devices/index'

  root to: 'static_pages#root', via: :get
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :devices, only: [:index]
end
