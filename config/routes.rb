Rails.application.routes.draw do
  devise_for :users
  resources :emails
  resources :posts
  root 'posts#index'
end
