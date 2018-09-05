Rails.application.routes.draw do
  resources :posts
  root 'posts#index'
  devise_for :users

  resources :applies, only: [:create, :destroy, :index]
  get "/list_applies", to: 'applies#find_owner_post_applies'
end
