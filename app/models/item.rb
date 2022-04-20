class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_detaills
  belongs_to :genre
  has_one_attached :item_image

  def get_item_image
    profile_image.variant(resize_to_limit: [100, 100]).processed
  end
end
