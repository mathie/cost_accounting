CostAccounting::Application.routes.draw do
  resources :companies, shallow: true do
    resources :products do
      resources :fixed_direct_costs, :variable_direct_costs, :semi_variable_direct_costs
    end
  end

  devise_for :users

  root :to => 'pages#index'
end
