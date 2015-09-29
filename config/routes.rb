Rails.application.routes.draw do


resources :wikis

devise_for :users
root to: "welcome#index"

resources :users, only: [:show, :update, :index, :create, :new] do
    resources :wikis
  end
end
