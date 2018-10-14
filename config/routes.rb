Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/'  do
    # expecting requests in JSON format, and move api requests under `api` subdomain
    # all controllers available on http://api.myapp.com/...
  end
end
