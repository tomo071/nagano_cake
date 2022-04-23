class CreateOrderDetaills < ActiveRecord::Migration[6.1]
  def change
    create_table :order_detaills do |t|

      t.integer:item_id
      t.integer:order_id
      t.integer:price
      t.integer:quantity
      t.integer:is_activ


    end
  end
end
