Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :users
    resources :memos, only: [:index, :create, :destroy] do  
      resource :favorites, only: [:create, :destroy]
    end
  end
end
