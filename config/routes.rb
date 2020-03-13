# frozen_string_literal: true

Rails.application.routes.draw do
  get 'journeys/create'
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  resources :pigeons, only: %i[index new show create destroy] do
    resources :journeys, only: :create
  end
end
