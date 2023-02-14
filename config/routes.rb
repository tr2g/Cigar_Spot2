Rails.application.routes.draw do
  get 'users/show'
  get 'comments/new'
  get 'comments/index'
  get 'comments/show'
  get 'comments/edit'
  devise_for :users
  get 'homes/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
