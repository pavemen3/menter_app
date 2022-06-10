Rails.application.routes.draw do
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
    resources :books, defaults: { format: :json }
  end
  namespace :public do
    resources :users
    resources :books
  end

  # devise_scope :admin do
  #   get 'admin/api/books', to: 'admin/books#index', defaults: { format: :json }
  # end

  # devise管理をしているモデルは「devise_scope :model名」を設定しないとroute errorが出る
  devise_scope :user do
    get 'public/api/books', to: 'public/books#index_api', defaults: { format: :json }
    get 'public/api/users', to: 'public/users#index_api', defaults: { format: :json }
  end

  # scope '/api' do
  #   get '/contents', to: 'contents#index', defaults: { format: :json }
  #   get '/contents/:id', to: 'contents#show', defaults: { format: :json }
  # end

  # ログイン画面をrootに設定
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end

  get "home/about"=>"homes#about", as: "about"
end
