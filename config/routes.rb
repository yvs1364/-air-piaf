Rails.application.routes.draw do
  root to: 'pages#home'
  resources: :pigeons, :only w%(index new show create)do
  resouces: :journeys, only: :create
end
