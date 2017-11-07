Rails.application.routes.draw do
  root to: "welcome#index"

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :projects, only: [:index, :new, :create, :show]
  resources :original_budget, only: [:new]
end
