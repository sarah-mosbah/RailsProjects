Rails.application.routes.draw do


  get 'comments/new' 
  post 'comments/create', as: :comments
  get 'comments/edit'
  put 'comments/update'
  get  'comments/:id', to: "comments#show", as: :show_comment
  delete 'comments/:id', to: 'comments#destroy'
  root to: 'subs#index'
  resources :users,  only: [:new, :create]
  resources :subs 
  resources :posts, only:[:new, :edit,:update, :create, :show]
  get 'sessions/new', as: :new_sessions
  post 'sessions/create' 
  post 'sessions/login'
  get 'sessions/logout' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
