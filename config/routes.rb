# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root 'pages#index'
    resources :questions do
      resources :answers, only: %i[create edit update destroy]
    end
    resources :users, only: %i[new create edit update]
    resource :session, only: %i[new create destroy]
    namespace :admin do
      resources :users, only: %i[index create]
    end
  end
end
