Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :items do
    resources :bookings, only: [:new, :create]
    collection do
      get :my_items, to: 'items#my_items'
    end
  end
  resources :bookings, only: [:index, :show, :edit, :update, :destroy]
  get "/bookings/:id/cancel", to: "bookings#cancel", as: "booking_cancel"
  resources :reviews
  resources :favourites
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
