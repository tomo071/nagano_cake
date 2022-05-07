class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum is_activ: { cannot: 0, wait: 1, manufacring: 2, complete:3 }
  def subtotal
    price * quantity
  end
end
