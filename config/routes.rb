CostAccounting::Application.routes.draw do
  resources :companies do
    resources :products
  end

  devise_for :users

  root :to => 'pages#index'
end
