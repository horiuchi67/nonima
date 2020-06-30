class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  enum payment: { クレジットカード:  1, 銀行振込: 2}

  validates :postal_code, presence: true, length: { is: 7 }
  validates :address,:name,:payment,:total_fee, presence: true
  attr_accessor :select,:shipping
end
