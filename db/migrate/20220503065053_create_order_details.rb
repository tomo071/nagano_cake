class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      
      t.integer:item_id
      t.integer:order_id
      t.integer:price
      t.integer:quantity
      t.integer:is_activ

      t.timestamps
    end
  end
end
