Rails.application.routes.draw do
  root to: 'application#index'
  namespace :api, defaults: { format: 'json' } do
    resources :users
    scope module: :v1 do
      
      resource :sessions, only: %[index create]
    end
  end 
end
