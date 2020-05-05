Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'
  resources :manufacturers, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :car_categories, only: [:index, :show]
  resources :car_models, only: [:index, :show, :new, :create]
end
