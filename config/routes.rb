Rails.application.routes.draw do
get "welcome/index"

devise_for :users
root to: 'welcome#index'

resources :wikis

resources :users, only: [:show, :update, :index, :new] do
    resources :wikis
  end
end
