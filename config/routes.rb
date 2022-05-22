Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  get '/' => 'homes#top'

  namespace :admin do
    resources :items
    resources :homes
    resources :genres
    resources :customers
    resources :orders
    resources :order_details
  end

  resources :homes
  resources :items
  resources :customers
  resources :cart_items
  resources :orders
  resources :addresses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
