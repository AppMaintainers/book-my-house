Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :bookings, only: [ :index, :new, :create ]

  root "bookings#index"
end
