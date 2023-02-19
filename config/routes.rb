Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #resources :comments
  resources :users, only: [:show, :edit, :update]

  resources :shops do
    resource :favorites, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]
  end
end
