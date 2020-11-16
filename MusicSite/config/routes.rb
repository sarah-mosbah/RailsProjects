Rails.application.routes.draw do

   root to: redirect('/bands')

   resources :users,  only: [:new, :create, :show]
   resource :session,  only: [:new, :create, :destroy]
   resources :bands  do
      resources :albums, only: [:new]
   end

   resources :albums, only: [:show, :create, :edit, :update, :destroy ] do
      resources :tracks, only: [:new]
   end
   resources :tracks, only: [:show, :create, :edit, :update, :destroy ]

   resources :notes, only: [:create, :destroy]
end
