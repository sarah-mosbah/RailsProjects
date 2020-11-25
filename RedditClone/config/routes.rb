Rails.application.routes.draw do
  resources :users,  only: [:new, :create]
  get 'sessions/new', as: :new_sessions
  post 'sessions/create' 
  post 'sessions/login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
