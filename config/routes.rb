Rails.application.routes.draw do
  resources :friends
  resources :users, only: [:create]
  resources  :sessions, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
