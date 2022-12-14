Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }, :path => 'authenticate'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#welcome"
  
  resources :users do
    get "reset_password"
  end
  resources :warehouse_details
  resources :warehouse_records
  resources :categories
  resources :products
  resources :entities
  resources :notes
  resources :note_products
end
