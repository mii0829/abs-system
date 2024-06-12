Rails.application.routes.draw do
  resources :lists  

  resources :reserves do
    member do
      post 'return', to: 'reserves#return'
      post 'borrow', to: 'reserves#borrow'
    end
  end
  resources :users do
    patch 'owner', on: :member, action: :update_owner
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
