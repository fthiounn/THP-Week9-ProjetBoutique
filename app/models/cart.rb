class Cart < ApplicationRecord
  has_one :user
  has_many :cart_items
  has_many :items, through: :cart_items

  def get_price
    cart_item = CartItem.where(cart_id: self.id)
    price = 0
    cart_item.each do |x|
      price += x.get_item.price * x.quantity
    end
    price
  end
end
