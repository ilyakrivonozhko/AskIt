Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "pages#index"
  resources :questions do
      resources :answers, only: %i[create edit update destroy]
  end
  resources :users, only: %i[new create]
end
