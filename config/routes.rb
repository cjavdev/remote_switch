Rails.application.routes.draw do
  root to: 'static_pages#root', via: :get
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
end
