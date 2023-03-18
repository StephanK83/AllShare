Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "about_us", to: "pages#about_us"
  get "how_it_works", to: "pages#how_it_works"
  resources :items do
    resources :bookings, only: [:new, :create] do
      resources :reviews, only: [:new, :create]
    end
    collection do
      get :my_items, to: 'items#my_items'
      get :my_favorite_items, to: 'items#my_favorite_items'
    end
    member do
      post :toggle_favorite, to: "items#toggle_favorite"
    end
  end
  resources :bookings, only: [:index, :show, :edit, :update, :destroy]
  get "/bookings/:id/cancel", to: "bookings#cancel", as: "booking_cancel"
  get "/bookings/:id/accept", to: "bookings#accept", as: "booking_accept"
  get "/bookings/:id/decline", to: "bookings#decline", as: "booking_decline"
  resources :reviews, only: [:index, :show, :edit, :update, :destroy]
  resources :favourites
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
