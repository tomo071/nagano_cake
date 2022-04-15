class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      
      t.string:name
      t.text:introduction
      t.integer:price
      t.boolean:is_activ, default:true

      t.datetime:created_at
      t.datetime:updated_at
    end
  end
end
