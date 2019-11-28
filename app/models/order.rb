class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  after_create :order_confirmation_email

  def order_confirmation_email
    UserMailer.order_confirmation_email(self.user, self)
  end

  def get_price
    order_items = OrderItem.where(order_id: self.id)
    price = 0
    order_items.each do |x|
      price += x.get_item.price * x.quantity
    end
    price
  end
end
