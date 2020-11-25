Rails.application.routes.draw do
  root to: 'home#index'
  resources :users,  only: [:new, :create]
  get 'sessions/new', as: :new_sessions
  post 'sessions/create' 
  post 'sessions/login'
  get 'sessions/logout' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
