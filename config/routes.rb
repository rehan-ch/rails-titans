# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'public#welcome'
  get :about, to: 'public#about'
  get :contact_us, to: 'public#contact_us'

  resource :public, only: [], controller: 'public' do
    post :create_contact_form_info
  end

  resource :dashboard, only: [:show], controller: 'dashboard'
  resources :users, only: %I[show index] do
    member do
      get :follow
      delete :un_follow
    end
    resources :articles, only: %I[show index]
  end
  namespace :me do
    resources :articles
    resource :users
  end

  resources :articles, only: %I[show index] do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
