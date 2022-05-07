class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.integer:customer_id
      t.string:postal_code
      t.string:postal_address
      t.string:postal_name
      t.integer:postage
      t.integer:price
      t.integer:pay_method
      t.integer:is_activ


      t.timestamps
    end
  end
end
