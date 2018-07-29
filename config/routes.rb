Rails.application.routes.draw do
  devise_for :users, skip: :all

  namespace :api, defaults: { format: 'json' } do

    mount_devise_token_auth_for 'User', at: 'auth'

    resources :users, only: [:index, :create, :update]
    get 'users/export_csv', to: 'users#export_csv', format: 'csv'
    get 'users/export_pdf', to: 'users#export_pdf', format: 'pdf'

    # Test custom devise token auth sign in route
    post 'login', to: 'sessions#create'

    devise_scope :user do
      post 'generate_new_password_email', to: 'passwords#create'
      put 'reset_password', to: 'passwords#update'
    end

    mount ActionCable.server => '/cable'

    resources :messages, only: [:index, :create, :update, :destroy]
  end
end
