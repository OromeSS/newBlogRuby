Rails.application.routes.draw do
  resources :comments
  resources :posts
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/hello', to: 'home#hello'
  root to: redirect('/posts')
end
