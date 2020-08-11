Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  root "toppages#index"

  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  resources :products do   
    collection do
      post 'purchase'
      get 'buy'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'search'
    end

    resource :likes, only: [:create, :destroy]

  end 
  resources :users, only: [:index, :new, :edit]
  resources :users, only: [:index, :new, :edit] do
    collection do
      get "bought"
      get "selled"
    end
  end
  resources :favs, only: [:index, :create, :destroy] 
  resources :cards, only: [:new, :update, :create, :show , :destroy] 
  resources :registration, only: [:index]
  resources :comments, only: [:create, :edit, :update, :destroy]
end
