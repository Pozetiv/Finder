Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end

  root 'posts#index'
  devise_for :users


    resources :resumes, expect: [:index]




  resources :applies, only: [:create, :destroy, :index]
  get "/list_applies", to: 'applies#find_owner_post_applies'
end
