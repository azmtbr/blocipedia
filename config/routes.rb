Rails.application.routes.draw do


get "welcome/index"

devise_for :users
root to: 'welcome#index'

resources :charges, only: [:new, :create]
resources :wikis do
  resources :collaborators, only: [:create, :destroy]
end

resources :charges, only: [:new, :create]

get 'downgrade' => 'users#downgrade'

resources :users, only: [:show, :update, :index, :new] do
    resources :wikis
  end
end
