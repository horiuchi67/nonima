class Genre < ApplicationRecord
  has_many :items

  validates :name, presence: true, uniqueness: true

  enum is_status: { 無効: false, 有効: true }
end
