class CartItem < ApplicationRecord
  belongs_to :cart
  has_many :items

  validates :quantity,
    presence: true,
    numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 20}

  def get_item
    Item.find(self.item_id)
  end

  def get_price
    return Item.find(self.item_id).price * self.quantity
  end
end
