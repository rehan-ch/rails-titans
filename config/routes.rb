# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'public#welcome'
  resource :dashboard, only: [:show], controller: 'dashboard'
  resources :users, only: %I[show index] do
    resources :articles, only: %I[show index]
  end
  namespace :me do
    resources :articles
  end

  resources :articles, only: %I[show index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
