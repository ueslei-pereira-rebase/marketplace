Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  
  namespace :manager do
    root 'home#index'
    resources :companies
  end

  namespace :account do
    root 'home#index'
    resources :users, only: %i[edit update show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
