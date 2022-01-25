class Warehouse < ApplicationRecord
  belongs_to :user
  has_many :warehouse_products 
  has_many :products, through: :warehouse_products

  validates :name, presence: true, uniqueness: true
end
