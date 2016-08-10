Rails.application.routes.draw do
  root to: "welcome#index"

  get  'welcome/index', to: 'welcome#index'
  # post 'user/create',  to: 'users#create'
  post 'users/signin',  to: 'users#signin',  as: :signin

  get 'api', to: 'api#index'
  post 'api', to: 'api#index'

end
