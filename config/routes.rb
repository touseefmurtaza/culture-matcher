# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :culture_types
      resources :applicants
      resources :companies
      resources :matches, except: :update
    end
  end
end
