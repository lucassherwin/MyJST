Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :users
  get 'app', to: 'users#index'

  get 'jobs', to: 'jobs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
