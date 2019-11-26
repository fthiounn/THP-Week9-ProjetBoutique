class Cart < ApplicationRecord
  has_one :user
  has_many :cart_items
  has_many :items, through: :cart_items
end
