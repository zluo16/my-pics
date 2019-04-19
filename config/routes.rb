Rails.application.routes.draw do
  root to: 'client#index'
  namespace :api do
    resources :users, only: [:index, :create, :update]
  end
end
