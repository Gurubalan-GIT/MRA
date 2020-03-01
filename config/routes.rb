Rails.application.routes.draw do
  root to: 'homes#index'
  devise_for :users
  resources :rooms
  resources :meetings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
