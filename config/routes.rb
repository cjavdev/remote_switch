Rails.application.routes.draw do
  get 'sessions/new'

  get 'static_pages/root'

  root to: 'static_pages#root', via: :get
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create]
end
