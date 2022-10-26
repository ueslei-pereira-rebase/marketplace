Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  
  namespace :manager do
    root 'home#index'
    resources :companies
  end

  namespace :account do
    root 'home#index'
    resources :users, only: %i[edit update show destroy]
    resources :products do
      get 'desactive', on: :member
      get 'active', on: :member
    end
  end

  namespace :advertise do
    resources :products  do
      member do

        get :join, to: 'products#join'
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
