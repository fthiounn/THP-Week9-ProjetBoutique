class Item < ApplicationRecord
  has_many :cart_items
  has_many :carts, through: :cart_items
  has_many :order_items
  has_many :orders, through: :order_items
  has_one_attached :avatar

  validates :date, presence: true
  validates :city_id, presence: true

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
