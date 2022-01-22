class Product < ApplicationRecord
  has_many :product_warehouses
  has_many :warehouses, through: :product_warehouses

  # accepts_nested_attributes_for :warehouses
  
  validates :name, :price, presence: true
  validates :name, uniqueness: true
  validates :name, format: {without: /[0-9]/, message: "does not allow numbers"}

  validates :price, numericality: {only_integer: true, greater_than: 0}

  validates :description, length: {maximum: 200}

  # validates :quantity, numericality: {greater_than_or_equal_to: 0}

end
