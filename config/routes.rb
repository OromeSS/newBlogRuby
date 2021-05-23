Rails.application.routes.draw do
  root to: redirect('/posts')
  resources :posts do
    resources :comments
  end
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
