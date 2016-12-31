Rails.application.routes.draw do
  devise_for :users
  get 'topics/index'

  resources :topics
end
