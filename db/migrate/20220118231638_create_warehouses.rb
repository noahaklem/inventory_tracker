class CreateWarehouses < ActiveRecord::Migration[6.1]
  def change
    create_table :warehouses do |t|
      t.string :name
      t.belongs_to :user

      t.timestamps
    end
  end
end
