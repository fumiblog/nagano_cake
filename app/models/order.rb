class Order < ApplicationRecord

    belongs_to :customer
    has_many :order_details, dependent: :destroy

    # accepts_nested_attributes_for :order_detail

    enum payment_method: {クレジットカード: 0, 銀行振込: 1}
    # enum flag: {カレント: 0, アドレス: 1, ニュー: 2}

    

end
