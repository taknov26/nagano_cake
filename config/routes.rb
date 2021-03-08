Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:       'admins/sessions',
    passwords:      'admins/passwords',
    registrations:  'admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions:       'public/sessions',
    passwords:      'public/passwords',
    registrations:  'public/registrations'
  }
  root :to => 'admins/homes#top'

  namespace :admins do
    resources :items
    resources :genres, only:[:index, :create, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
