class CartItem < ApplicationRecord
  belongs_to :cart
  has_many :items

  validates :quantity,
    presence: true,
    numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 20}
end
