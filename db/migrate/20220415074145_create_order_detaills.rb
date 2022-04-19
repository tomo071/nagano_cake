class CreateOrderDetaills < ActiveRecord::Migration[6.1]
  def change
    create_table :order_detaills do |t|
      
      t.integer:price
      t.integer:quantity
      t.integer:is_activ

    
    end
  end
end
