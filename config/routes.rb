Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    get 'tasks/index'
    post 'tasks/create'
    post 'tasks/update'
    post 'tasks/destroy'
    post 'users/create'
    post 'users/update'
    post 'sessions/create'
    get 'events/index'
    post 'events/create'
    post 'events/destroy'
    post 'events/update'


  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/'  do
  #   # expecting requests in JSON format, and move api requests under `api` subdomain
  #   # all controllers available on http://api.server-rails.com/testing
  #   resource :testings
  # end
end
