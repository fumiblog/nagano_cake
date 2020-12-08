class Customer < ApplicationRecord
  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  
  enum is_deleted: {Abailable: false, Invalid: true}
  def active_for_authentication?
    super && (self.is_deleted === "Abailable")
  end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
end
