class Warehouse < ApplicationRecord
  belongs_to :user
  has_many :warehouse_products
  has_many :products, through: :warehouse_products, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
