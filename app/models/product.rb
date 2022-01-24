class Product < ApplicationRecord
 belongs_to :warehouse
 belongs_to :user 

  # accepts_nested_attributes_for :warehouses
  
  validates :name, :price, presence: true
  validates :name, uniqueness: true
  validates :name, format: {without: /[0-9]/, message: "does not allow numbers"}

  validates :price, numericality: true

  validates :description, length: {maximum: 200}

  validates :quantity, numericality: {greater_than_or_equal_to: 0}
  
  def self.by_warehouse(warehouse)
    where(warehouse: warehouse)
  end
end
