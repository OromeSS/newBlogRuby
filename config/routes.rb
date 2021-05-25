Rails.application.routes.draw do
  root to: redirect('/posts')
  resources :posts do
    resources :comments
  end
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # get 'posts/index/:category', to: 'posts#index', as: 'post_search'
  # get 'posts/:category', to: 'posts#indexByCategory', as: 'posts_category'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
