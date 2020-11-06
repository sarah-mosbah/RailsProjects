Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only:[:create, :destroy, :index, :show, :update] do
      resources :art_works, only:[:index]
  end
  resources :art_works, only:[:create, :destroy, :show, :update]
  resources :art_work_shares, only:[:create, :destroy]
end
