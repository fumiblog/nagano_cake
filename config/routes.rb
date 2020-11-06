Rails.application.routes.draw do
  devise_for :admins, class_name: "Admin::Admin"
  devise_for :customers, class_name: "Public::Customer"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'homes/about' => 'homes#about'
  get 'public/homes/top' => 'homes#top'


  scope 'admin' do
    resources :genres, only: [:index, :create, :edit, :update]
  end

  scope 'admin' do
  resources :items, except: [:destroy]
  end

  scope 'admin' do
    resources :customers, only: [:index, :create, :edit, :update]
  end

  scope 'public' do
    resources :customers, only: [:new, :create]
  end

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

  scope 'public' do
    resources :addresses, only: [:index ,:create, :update, :destroy]
  end

  scope 'public' do
    resources :cart_items, only: [:index, :update, :create, :destroy]
  end
  delete 'public/destroy_all' => 'public#destroy_all'

end
