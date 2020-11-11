Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins, class_name: "Admin::Admin"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'homes/about' => 'homes#about'
  get 'public/homes/top' => 'homes#top'


  # scope 'admin' do
  #   resources :genres, only: [:index, :create, :edit, :update]
  # end

  # scope 'admins' do
  #   resources :items, except: [:destroy]
  # end

  namespace 'admins' do
    resources :customers, only: [:index, :create, :show, :edit, :update]
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
  end

  namespace 'public' do
    resources :customers, only: [:new, :create, :show, :edit, :update]
    resources :addresses, only: [:index, :show, :create, :edit, :update, :destroy]
    resources :cart_items, only: [:index, :update, :create, :destroy]
    resources :items, only: [:index, :show]
  end

  get 'public/customers/unsubscribe/:id' => 'public/customers#unsubscribe', as: 'customers_unsubscribe'

  scope 'admin' do
    resources :orders, only: [:index, :show, :update]
  end

  resources :orders, only: [:index, :show, :new, :create]

  # get 'orders/new' => 'orders#new'
  post 'orders/comfirm' => 'orders#comfirm'
  get 'orders/complete' => 'orders#complete'
  # post 'orders' => 'orders#create'
  # get 'orders/index' => 'orders#index'
  # get "orders/show" => 'orders#show'

  scope 'admin' do
    resources :order_details, only: [:update]
  end

  delete 'public/destroy_all' => 'public#destroy_all'

end
