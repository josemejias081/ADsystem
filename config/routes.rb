Rails.application.routes.draw do
  resources :warehouse_details
  resources :warehouse_records
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#welcome"

  resources :categories
  resources :products
  resources :clients
  resources :notes
  resources :note_products

  #resources :notes do
  #  resources :products

  #end
end
