Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"

  resources :events
  resources :event_attendings
  resources :users, only:[:show]
  get "events/index", to: "events#index"
end
