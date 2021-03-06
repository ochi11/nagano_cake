Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  get '/' => 'homes#top'
  get '/admin' => 'admin/homes#top'
  get '/about' => 'homes#about'
  get '/customers/my_page' => 'public/customers#show'
  get '/customers/edit' => 'public/customers#edit'
  #get 'admin/genres/:id' => 'admin/genres#index'
  root to: 'top#index'

  namespace :admin do
    resources :items, only: [:edit, :update, :create, :index, :show, :new]
    resources :homes
    resources :genres, only: [:edit, :update, :create, :index]
    resources :customers
    resources :orders
    resources :order_details
  end

  namespace :public do
    resources :homes
    resources :items
    resource :customers do
      collection do
        get 'unsubscribe'
        patch 'withdraw'
      end
    end
    resources :cart_items do
      collection do
        delete 'destroy_all'
      end
    end
    resources :orders do
      collection do
        get 'complete'
        post 'confirm'
      end
    end
    resources :addresses
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
