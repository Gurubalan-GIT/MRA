Rails.application.routes.draw do
  root to: 'homes#index'
  get '/meetings/calendar' => 'meetings#calendar', as:'calendar'
  get '/allmeetings' => 'meetings#allmeetings', as:'all_meetings'
  get '/allusers' => 'meetings#allusers', as:'all_users'
  devise_for :users
  resources :rooms
  resources :meetings do
    member do
      get :destroyAll
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
