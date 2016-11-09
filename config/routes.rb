Rails.application.routes.draw do
  devise_for :users
  resource :profile

  resources :posts do
    resources :comments
  end
  root to: 'posts#index'
end
