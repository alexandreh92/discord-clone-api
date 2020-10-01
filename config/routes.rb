Rails.application.routes.draw do
  devise_for :users, skip: :all
  namespace :api do
    devise_scope :user do
      resources :sessions, only: [:create]
    end

    resources :servers, only: %i[index create] do
      get :join, on: :collection
    end
    resources :rooms, only: %i[index create]
    resources :messages, only: [:create]
  end
end
