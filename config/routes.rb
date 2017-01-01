Rails.application.routes.draw do
  devise_for :users

  resources :topics

  root 'top#index'
end
