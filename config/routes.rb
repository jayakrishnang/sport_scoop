Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  get 'home' => 'home#index'
  get 'points_table' => 'home#points_table'
  resources :matches, only: [:index, :show]
end
