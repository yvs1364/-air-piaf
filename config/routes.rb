Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pigeons, only: %i(index new show create) do
    resources :journeys ,only: :create
  end
end
