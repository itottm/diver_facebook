Rails.application.routes.draw do
  get 'topics/index'

  resources :topics
end
