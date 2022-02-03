class Warehouse < ApplicationRecord
  belongs_to :user
  has_many :warehouse_products
  has_many :products, through: :warehouse_products, dependent: :destroy

  accepts_nested_attributes_for :products, reject_if: proc { |attributes| attributes['name'].blank? }

  validates :name, presence: true, uniqueness: true
  
  # validate :is_title_case

  # before_validation :make_title_case

end
