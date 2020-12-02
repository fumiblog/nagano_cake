class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters , if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Customer
      public_items_path
    when Admin
      admins_homes_top_path
    end
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [
        :last_name,
        :first_name,
        :last_name_kana,
        :first_name_kana,
        :postal_code,
        :address,
        :telephone_number,
        :is_deleted])
    end

    # def configure_permitted_parameters
    #   keys = {sign_up: [:username], account_update: [:username, :useraddress] }
    #   keys.each_pair do |action, key|
    #     devise_parameter_sanitizer.permit(action, keys: key)
    #   end
    # end


  # if before_action :authenticate_admin!
  #   def after_sign_in_path_for(resource)
  #     admins_homes_top_path # ログイン後に遷移するpathを設定
  #   end

  #   def after_sign_out_path_for(resource)
  #     new_admin_session_path # ログアウト後に遷移するpathを設定
  #   end
  # elsif  before_action :authenticate_customer!
  #   def after_sign_in_path_for(resource)
  #     public_items_path # ログイン後に遷移するpathを設定
  #   end

  #   def after_sign_out_path_for(resource)
  #     public_items_path # ログアウト後に遷移するpathを設定
  #   end
  # else
  # end





  # before_action :authenticate_admin!
  # def after_sign_out_path_for(resource)
  #   new_admin_session_path
  # end

  # before_action :authenticate_customer!
  # def after_sign_out_path_for(resource)
  #   root_path
  # end

  # def after_sign_out_path_for(resource)
  #   new_admin_session_path
  # end

  def after_sign_out_path_for(resource)
    # byebug
    case resource
    when :customer
      root_path
    when :admin
      new_admin_session_path
    end
  end




  # def after_sign_out_path_for(resource_or_scope)
  #   # byebug
  #   if resource_or_scope == :admin
  #     new_admin_session_path
  #   else
  #     root_path
  #   end
  # end

  private
  #セッションの作成
  def current_cart
    # binding.pry
    CartItem.find(session[:cart_item_id])
    # binding.pry


  rescue ActiveRecord::RecordNotFound
    cart_item = CartItem.create
    # binding.pry
    session[:cart_item_id] = cart_item.id
    cart_item

  end
  # def current_cart
  #   # binding.pry
  #   # セッションから取得したcart_idを元にCartテーブルからCart情報を取得
  #   current_cart = CartItem.find_by(id: session[:cart_id])
  #   # Cart情報が存在しない場合、@current_cartを作成
  #   current_cart = CartItem.create unless current_cart
  #   # 取得したCart情報よりIDを取得し、セッションに設定
  #   session[:cart_id] = current_cart.id
  #   # Cart情報を返却
  #   current_cart
  # end



end
