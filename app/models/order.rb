class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer
  enum pay_method: { credit_card: 0, transfer: 1 }
  enum is_activ: { wait: 0, confirm: 1, manufacring:2, preparation:3, shipping:4}
  def address_display
    '〒' + postal_code + ' ' + postal_address + ' ' + postal_name
  end
  def postage_total
    price + postage
  end
  def total_quantity
    sum=0
    order_details.each do |order_detail|
      sum+=order_detail.quantity
    end
    return sum
  end
end
