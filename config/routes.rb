Rails.application.routes.draw do
  # root to: 'welcome#index' # eventually build a welcome page with signup/login buttons

  # set up api routes
  # these only return json -- eventually these should be protected
  scope :api do
    resources :jobs
    resources :tasks
  end

  # Route to hit the Vue app
  scope :app do
    get "/", to: "welcome#index", format: false
    
    get "/*path", to: "welcome#index", format: false
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
