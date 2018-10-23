Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    get 'testings/index'
    get 'testings/show'
    post 'users/create'
    post 'sessions/create'

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/'  do
  #   # expecting requests in JSON format, and move api requests under `api` subdomain
  #   # all controllers available on http://api.server-rails.com/testing
  #   resource :testings
  # end
end
