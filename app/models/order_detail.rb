class OrderDetail < ApplicationRecord
	belongs_to :order
	belongs_to :product

  validates :price,:amount,presence: true
end
