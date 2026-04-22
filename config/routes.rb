Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :bookings, only: [ :index, :new, :create ]

  resource :query, only: [ :new, :create ]

  namespace :api do
    resource :query, only: [ :create ]
  end

  root "bookings#index"
end
