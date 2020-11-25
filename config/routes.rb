Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins, class_name: "Admin::Admin"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'homes/about' => 'homes#about'
  get 'public/homes/top' => 'homes#top'
  get 'public/homes/top2' => 'homes#top2'
  # post 'public/cart_items' => 'cart_items#add_item'

  root 'homes#top2'




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
