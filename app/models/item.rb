class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_detales, dependent: :destroy
  
  belongs_to :genre
  attachment :image
end
