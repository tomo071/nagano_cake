class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_detaills
  belongs_to :genre
end
