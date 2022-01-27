class Product < ApplicationRecord
  belongs_to :user
  has_many :warehouse_products
  has_many :warehouses, through: :warehouse_products
  validate :is_title_case

  validates :name, :price, presence: true
  validates :name, uniqueness: true
  validates :name, format: {without: /[0-9]/, message: "does not allow numbers"}

  validates :price, numericality: true

  validates :description, length: {maximum: 200}

  validates :quantity, numericality: true
  
  before_validation :make_title_case

  private

  def is_title_case
    if name.split.any?{|w| w[0].upcase != w[0]}
      errors.add(:name, "Name must be in title case.")
    end
  end

  def make_title_case
    self.name = self.name.titlecase
  end
  
  # def self.by_warehouse(warehouse)
  #   where(warehouse: warehouse)
  # end

  # def warehouse_id=(id)
  #   self.warehouse = Warehouse.find(id)
  # end

  # def warehouse_id
  #   self.warehouse ? self.warehouse.name : nil
  # end

end
