Rails.application.routes.draw do

  #ユーザー用ルーティング
  devise_for :users
  root to: 'homes#top'

  post 'shops/search', to: 'shops#search'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #resources :comments
  resources :users, only: [:show, :edit, :update] do
    get :favorites, on: :collection
  end

  resources :shops do
    resource :favorites, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]

  end

end
