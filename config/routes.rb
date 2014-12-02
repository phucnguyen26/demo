Rails.application.routes.draw do
root "static_pages#home"

get 'help'    => 'static_pages#help'
get 'home'    => 'static_pages#home'
get 'signup'  => 'users#new'

get    'login'   => 'sessions#new'
post   'login'   => 'sessions#create'
delete 'logout'  => 'sessions#destroy'
resources :users do
    member do
      get :following, :followers
    end
  end
 resources :words, only: [:index]
 resources :categories, only: [:index]
 resources :account_activations, only: [:edit]
 resources :relationships,       only: [:create, :destroy]
 #match "/users/:id/:follow_type", as: "follow_user", to: "users#index", via: "get"
end
