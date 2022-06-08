Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # root to: "homes#about"
  namespace :admin do
    resources :users
    resources :books
  end
  namespace :public do
    resources :books, only: [:index, :show, :new, :edit]
  end

  namespace :admin do
  end
  # ログイン画面をrootに設定
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  get "home/about"=>"homes#about", as: "about"
  resources :users, only: [:index, :show, :edit]
  resources :books
end
