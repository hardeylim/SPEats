Rails.application.routes.draw do
 
  namespace :api, defaults: { format: 'json' } do
    resources :users
    #get 'sessions', to: 'create'
    get 'oauth/callback', to: 'oauths#callback'
  end
  
end


=begin
  namespace :v1 do
    resources :sessions, only [:login, :logout] do
      collection do
        post :login
        post :login
      end
    end


----
post '/login', to: 'sessions#create', as: 'login'
delete '' sessions#destroy
=end
