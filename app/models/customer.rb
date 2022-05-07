class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses
  has_many :orders
  has_many :cart_items
  def address_display
  '〒' + postal_code + ' ' + address + ' ' + first_name + last_name
  end
  def full_name
    first_name + last_name
  end

end
