class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  after_create :order_confirmation_email

  def order_confirmation_email
    UserMailer.order_confirmation_email(self.user, self).now
  end

end
