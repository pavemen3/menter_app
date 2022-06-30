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
    resources :books
  end
  namespace :public do
    resources :users
    resources :books
  end

  namespace :api do
    namespace :v1 do
      resources :books, only: %i[index]

      mount_devise_token_auth_for "User", at: "auth", controllers: {
        registrations: 'api/v1/auth/registrations'
      }

      namespace :auth do
        resources :sessions, only: %i[index]
      end
    end
  end

  # devise_scope :admin do
  #   get 'admin/api/books', to: 'admin/books#index', defaults: { format: :json }
  # end

  # devise管理をしているモデルは「devise_scope :model名」を設定しないとroute errorが出る
  devise_scope :user do
    get 'public/api/books', to: 'public/books#index_api', defaults: { format: :json }
    get 'public/api/users', to: 'public/users#index_api', defaults: { format: :json }
  end

  get "home/about"=>"homes#about", as: "about"
end
