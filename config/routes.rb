Rails.application.routes.draw do
  devise_for :users
  resource :profile

  resources :posts do
    resources :comments
    root to: 'manage/posts#index'
  end

  namespace :manage do
    resources :posts
    root to: 'posts#index'
  end

  resources :posts, only: [:index, :show] do
    resources :comments
  end
  
  root to: 'posts#index'
end
