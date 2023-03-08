Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :bookings
  resources :items
  resources :reviews
  resources :favourites
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
