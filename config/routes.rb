Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'bookings#index'

  namespace :api do
    resource :query, only: %i[create]
  end

  resources :bookings, only: %i[index new create]
  resource :query, only: %i[new create]
  resource :statistic, only: %i[show]
end
