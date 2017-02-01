Rails.application.routes.draw do
  resources :accounts do
    resources :transactions
  end

  resources :categories

  root 'accounts#index'
end
