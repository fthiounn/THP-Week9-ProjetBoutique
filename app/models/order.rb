class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  after_create :order_confirmation_email
  after_create :copy_order_admin

  def order_confirmation_email
    UserMailer.order_confirmation_email(self.user_id, self).deliver_now
  end
  def copy_order_admin
    UserMailer.copy_order_admin(self.user_id, self).deliver_now
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
