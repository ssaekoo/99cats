Rails.application.routes.draw do
  resources :cats
  resources :cat_rental_requests, only: [:create, :new, :edit, :update]
end
