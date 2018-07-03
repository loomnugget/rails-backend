Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # mount ActionCable.server => '/cable'
  # namespace :api, defaults: { format: 'json' } do
  # end

  devise_for :users, skip: :all
  resources :users, only: [:index, :create, :update], format: 'json'

  # resources :rooms, only: [:index, :create, :update, :destroy]
  # resources :messages, only: [:index, :create, :update, :destroy]
end
