class Product < ApplicationRecord

  belongs_to :user
  has_many :warehouse_products
  has_many :warehouses, through: :warehouse_products

  validates :name, :price, :quantity, presence: true
  validates :name, uniqueness: true

  validates :price, numericality: true

  validates :description, length: {maximum: 200}

  validates :quantity, numericality: true
  
  # validate :is_title_case
  
  # before_validation :make_title_case

  scope :alpha, -> {order("name")}

  def self.by_warehouse(warehouse_id)
    Warehouse.find(warehouse_id).products
  end
  
end
