Rails.application.routes.draw do
  # namespace :admin do
  #   get 'books/index'
  #   get 'books/show'
  #   get 'books/new'
  #   get 'books/edit'
  # end
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords'
  }
    devise_for :users, controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations'
  }

  root to: "homes#about"

  namespace :admin do
    resources :users
    resources :books
  end
  # namespace :public do
  #   resources :books, only: [:index, :show, :new, :edit]
  #   resources :users, only: [:index, :show, :new, :edit]
  # end

  # ログイン画面をrootに設定
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end

  get "home/about"=>"homes#about", as: "about"
end
