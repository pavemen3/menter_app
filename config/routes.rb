Rails.application.routes.draw do
  # root to: "homes#about"
  devise_for :users

  # ログイン画面をrootに設定
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  get "home/about"=>"homes#about", as: "about"
  resources :users, only: [:index, :show, :edit]
  resources :books
end
