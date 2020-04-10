Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: 'json' } do

    resources :order_requests do

    end

    resources :users do
      member do

      end
    end

    resources :restaurants do

    end

  end
end
