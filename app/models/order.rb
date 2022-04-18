class Order < ApplicationRecord
  has_many :order_detaills
  belongs_to :customer
end
