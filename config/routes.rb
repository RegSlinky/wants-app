Rails.application.routes.draw do
  devise_for :users
  get 'tweets/index'
  root to: "tweets#index"
  resources :tweets, only: [:index, :new, :create, :show, :destroy] do
    collection do
      get 'search'
    end
    resources :comments, only: :create
      resource :items, only: [:show, :new, :create]
  end

  resources :items, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :orders, only: [:index, :create]
  end
end
