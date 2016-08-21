Rails.application.routes.draw do
  root to: "welcome#index"
  post 'api', to: 'api#index'

  get 'api/create', to: 'api#create'
  post 'api/create', to: 'api#create'
  
  get 'api/photo', to: 'api#photo'
  post 'api/photo', to: 'api#photo'

  get 'api/edit', to: 'api#edit'
  post 'api/edit', to: 'api#edit'

  get 'api/search', to: 'api#search'
  post 'api/search', to: 'api#search'
end
