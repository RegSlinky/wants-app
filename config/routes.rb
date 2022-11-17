Rails.application.routes.draw do
  devise_for :users
  get 'tweets/index'
  root to: "tweets#index"
  resources :tweets, only: [:index, :new, :create, :show] do
    resources :comments, only: :create
  end
  resources :items, only: [:show, :new, :create]
end
