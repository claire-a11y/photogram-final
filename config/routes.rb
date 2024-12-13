# config/routes.rb
Rails.application.routes.draw do
 
  # 登录和注册的路由优先定义
  get "/users/sign_in", to: "sessions#new", as: :login
  post "/users/sign_in", to: "sessions#create"
  get "/users/sign_out", to: "sessions#destroy", as: :sign_out
  get "/users/sign_up", to: "users#new", as: :sign_up

  # 用户和其他资源的路由
  resources :users, param: :username, only: [:index, :show, :create]
  resources :photos, only: [:index, :create, :show] do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  resources :follow_requests, only: [:create, :destroy, :update]

  # 根路径
  root to: "users#index"
end
