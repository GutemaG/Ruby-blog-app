Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  root "users#index"

  resources :users, only:[ :index, :show] do
    resources :posts, only:[:index, :show, :new, :create, :destroy] do
      resources :comments, only:[:new,:create, :destroy]
      resources :likes, only:[:new ,:create]
      end
  end

  namespace :api do
    resources :users do
      resources :posts do
        resources :comments
      end
    end
  end
end