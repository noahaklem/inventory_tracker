class Warehouse < ApplicationRecord
  belongs_to :user
  has_many :warehouse_products
  has_many :products, through: :warehouse_products, dependent: :destroy

  validate :is_title_case

  before_validation :make_title_case

  validates :name, presence: true, uniqueness: true
  
  def products_attributes=(product_attributes)
    product_attributes.values.each do |product_attribute|
      product = Product.find_or_create_by(product_attribute)
      self.products << product
    end
  end

  private

  def is_title_case
    if name.split.any?{|w| w[0].upcase != w[0]}
      errors.add(:name, "Name must be in title case.")
    end
  end
  
  def make_title_case
    self.name = self.name.titlecase
  end

end
