Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :jobs
  resources :tasks
  # get 'app', to: 'jobs#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
