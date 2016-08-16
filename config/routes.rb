Rails.application.routes.draw do
  root to: "welcome#index"
  
  get 'api', to: 'api#index'
  post 'api', to: 'api#index'

  get 'api/create', to: 'api#create'
  post 'api/create', to: 'api#create'
  
  get 'api/photo', to: 'api#photo'
  post 'api/photo', to: 'api#photo'
end
