class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_detaills
  belongs_to :genre
  has_one_attached :item_image
  
  def with_tax_price
    (price * 1.1).floor
  end

  def get_item_image(*size)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      item_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'no_image.jpg')
    end

    if !size.empty?
      item_image.variant(resize: size)
    else
      item_image
    end
  end
end

