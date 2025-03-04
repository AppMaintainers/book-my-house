# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'bookings#index'

  namespace :api do
    resource :query, only: [:create]
  end

  resources :bookings, only: %i[index new create]
  resource :query, only: %i[new create]
  resource :statistic, only: [:show]
end
