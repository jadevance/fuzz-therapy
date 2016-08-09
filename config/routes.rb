Rails.application.routes.draw do
  root to: "welcome#index"

  get  'welcome/index', to: 'welcome#index'
  post 'user/create',  to: 'users#create'
  # post 'user/signin',  to: 'users#signin',  as: :signin
  # post 'user/signout'  to: 'users#signout', as: :signout
  # post 'user/reset_password'

  # get  'user/get_token'
  # get  'user/clear_token'

end
