Rails.application.routes.draw do
  root to: "welcome#index"
  post 'api', to: 'api#index'
  post 'api/create', to: 'api#create'
  post 'api/photo', to: 'api#photo'

  get 'api/update', to: 'api#update'
  put 'api/update', to: 'api#update'

  get 'api/search', to: 'api#search'
  post 'api/search', to: 'api#search' 
end
