class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :item_id, uniqueness: { scope: :customer_id }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
end
