class Warehouse < ApplicationRecord
  has_many :product_warehouses
  has_many :products, through: :product_warehouses

  validates :location, presence: true, uniqueness: true
end
