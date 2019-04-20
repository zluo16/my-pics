Rails.application.routes.draw do
  get 'auth/show'
  get 'auth/create'
  root to: 'client#index'
  namespace :api do
    resources :users, only: [:index, :create, :update]
  end
end
