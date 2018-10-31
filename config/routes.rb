Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    get 'tasks/index'
    post 'tasks/create'
    post 'tasks/update'
    post 'tasks/destroy'
    post 'users/create'
    post 'users/update'
    post 'sessions/create'
    get 'sessions/update'
    get 'events/index'
    post 'events/create'
    post 'events/destroy'
    post 'events/update'
    get 'messages/index'
    post 'messages/create'
    post 'messages/destroy'
    get 'nutritions/index'
    post 'nutritions/create'
    post 'nutritions/update'
    post 'nutritions/destroy'
    get 'exercises/index'
    post 'exercises/create'
    post 'exercises/update'
    post 'exercises/destroy'


  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/'  do
  #   # expecting requests in JSON format, and move api requests under `api` subdomain
  #   # all controllers available on http://api.server-rails.com/testing
  #   resource :testings
  # end
end
