class Item < ApplicationRecord
  belongs_to :city
  has_many :cart_items
  has_many :carts, through: :cart_items

  has_many :order_items
  has_many :orders, through: :order_items

  has_one_attached :avatar

  validates :title,
    presence: true,
    length: { in: 5..140 }

  validates :description,
    presence: true,
    length: { in: 20..1000 }

  validates :price,
    presence: true,
    numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 1000}

end
