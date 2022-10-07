Rails.application.routes.draw do
  resources :user_stocks, only: %i[create delete]
  get 'my_portfolio', to: 'users#my_portfolio'
  devise_for :users
  root 'welcome#index'
  get 'search_stock', to: 'stocks#search'
end
