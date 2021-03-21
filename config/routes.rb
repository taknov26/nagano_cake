Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:       'admins/sessions',
    passwords:      'admins/passwords',
    registrations:  'admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions:       'public/customers/sessions',
    passwords:      'public/customers/passwords',
    registrations:  'public/customers/registrations'
  }
  root :to => 'public/homes#top'
  get '/admin' => 'admins/homes#top' ,as: 'admins/top'
  get 'home/about' => 'public/homes#about' ,as: 'homes/about'


  namespace :admins do
    resources :items, only:[:index, :edit, :new, :show, :create, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:index, :show, :update, :edit]
    resources :orders_items, only:[:create, :update]

  end

  namespace :public do
    resources :items do
      resources :cart_items, only:[:create]
    end
    resources :customers
    resources :addresses
    delete 'cart_items/destroy_all'
    resources :cart_items, only:[:index, :update, :destroy]
    patch 'customer/release' => 'customers#release'
    post 'orders/confirm' => 'orders#confirm'
    get '/customers/mypage/confirm' => 'customers#confirm' ,as: 'customers/confirm'
    resources :orders, only: [:new, :create] do
      collection do
        post 'orders/confirm' => 'orders#confirm'
      end
    end
    get 'orders/complete' => 'orders#complete'
    resources :orders, only: [:show, :index]
  end
end
