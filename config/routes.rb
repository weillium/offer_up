Rails.application.routes.draw do
  root :to => "items#index"
  resources :purchases
  resources :comments
  resources :categories
  resources :items
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
