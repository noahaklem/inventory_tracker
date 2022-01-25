class Product < ApplicationRecord
  belongs_to :warehouse
  belongs_to :user 

  validates :name, :price, presence: true
  validates :name, uniqueness: true
  validates :name, format: {without: /[0-9]/, message: "does not allow numbers"}

  validates :price, numericality: true

  validates :description, length: {maximum: 200}

  validates :quantity, numericality: true
  validates :quantity, minimum: 1
  
  def self.by_warehouse(warehouse)
    where(warehouse: warehouse)
  end

  def warehouse_id=(id)
    self.warehouse = Warehouse.find(id)
  end

  def warehouse_id
    self.warehouse ? self.warehouse.name : nil
  end

end
