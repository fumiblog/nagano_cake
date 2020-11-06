class Item < ApplicationRecord

  has_many :genres, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :order_detales, dependent: :destroy

  attachment :image

end
