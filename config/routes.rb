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
  get 'home/about' => 'public/homes#about' ,as: 'homes/about'

  namespace :admins do
    resources :items, only:[:index, :edit, :new, :show, :create, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:index, :show, :update, :edit]

  end

  namespace :public do
    resources :items
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
