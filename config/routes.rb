Rails.application.routes.draw do
  # devise_for :admins
  # devise_for :admins, controllers: {
  #   sessions: 'admins/sessions'
  # }

 
  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
  end

  devise_for :customers, skip: :all
  devise_scope :customer do
    get 'customers/sign_in' => 'customers/sessions#new', as: 'new_customer_session'
    post 'customers/sign_in' => 'customers/sessions#create', as: 'customer_session'
    delete 'customers/sign_out' => 'customers/sessions#destroy', as: 'destroy_customer_session'
    get 'customers/sign_up' => 'customers/registrations#new', as: 'new_customer_registration'
    post 'customers' => 'customers/registrations#create', as: 'customer_registration'
    get 'customers/password/new' => 'customers/passwords#new', as: 'new_customer_password'
  end
  

  namespace :admins do
    get 'homes/top'
  end
  namespace :admins do
    get 'orders/index'
    get 'orders/show'
  end
  # devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'homes/about' => 'homes#about'
  get 'public/homes/top' => 'homes#top'
  get 'public/homes/top2' => 'homes#top2'
  get 'admins/homes/top' => 'homes#top'
  # post 'public/cart_items' => 'cart_items#add_item'

  root 'homes#top'

  namespace 'admins' do
    resources :customers, only: [:index, :create, :show, :edit, :update]
    resources :items
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only:[:update]
  end

  namespace 'public' do
    resources :items, only: [:index, :show]
    resources :customers, only: [:new, :create, :show, :edit, :update] do
      collection do
        patch :toggle_status
      end
    end
    resources :addresses, only: [:index, :show, :create, :edit, :update, :destroy]
    resources :orders, only: [:index, :show, :new, :create] do
      collection do
        post :confirm
        get :complete
      end
    end
    resources :cart_items, only: [:index, :update, :create, :destroy, :show] do
      collection do
        delete 'destroy_all'
      end
    end
  end

  get 'public/customers/unsubscribe/:id' => 'public/customers#unsubscribe', as: 'customers_unsubscribe'

  scope 'admin' do
    resources :orders, only: [:index, :show, :update]
  end





  # get 'orders/new' => 'orders#new'

  # post 'orders' => 'orders#create'
  # get 'orders/index' => 'orders#index'
  # get "orders/show" => 'orders#show'

  scope 'admin' do
    resources :order_details, only: [:update]
  end

  delete 'public/destroy_all' => 'public#destroy_all'

end
