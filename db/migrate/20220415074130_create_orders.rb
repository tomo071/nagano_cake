class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.string:postal_code
      t.string:postal_address
      t.string:postal_name
      t.integer:postage
      t.integer:price
      t.integer:pay_method
      t.integer:is_activ

    
    end
  end
end
