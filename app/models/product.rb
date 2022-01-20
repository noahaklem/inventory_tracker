class Product < ApplicationRecord
  has_many :product_warehouses
  has_many :warehouses, through: :product_warehouses
  
  validates :name, :price, presence: true
  validates :name, uniqueness: true

end
