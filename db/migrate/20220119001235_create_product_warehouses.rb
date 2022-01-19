class CreateProductWarehouses < ActiveRecord::Migration[6.1]
  def change
    create_table :product_warehouses do |t|
      t.integer :product_id
      t.integer :warehouse_id

      t.timestamps
    end
  end
end
