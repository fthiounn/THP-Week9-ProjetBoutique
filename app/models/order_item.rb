class OrderItem < ApplicationRecord
  has_many :items
  belongs_to :order

  def get_item
    Item.find(self.item_id)
  end

  def get_price
    return Item.find(self.item_id).price * self.quantity
  end
end
