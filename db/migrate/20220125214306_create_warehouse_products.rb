class CreateWarehouseProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :warehouse_products, id: false do |t|
        t.belongs_to :warehouse
        t.belongs_to :product

        t.timestamps
    end
  end
end
