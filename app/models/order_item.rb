class OrderItem < ApplicationRecord
  has_many :items
  belongs_to :order
end
