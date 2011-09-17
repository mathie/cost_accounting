CostAccounting::Application.routes.draw do
  resources :companies

  devise_for :users

  root :to => 'pages#index'
end
