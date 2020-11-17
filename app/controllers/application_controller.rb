class ApplicationController < ActionController::Base

  private
  #セッションの作成
  def current_cart
    # binding.pry
    CartItem.find(session[:cart_item_id])
    
    
  rescue ActiveRecord::RecordNotFound
    cart_item = CartItem.create
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
