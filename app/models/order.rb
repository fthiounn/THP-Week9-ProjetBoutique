class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  def get_price
    order_items = OrderItem.where(order_id: self.id)
    price = 0
    order_items.each do |x|
      price += x.get_item.price * x.quantity
    end
    price
  end
end
