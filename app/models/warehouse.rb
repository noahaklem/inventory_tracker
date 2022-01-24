class Warehouse < ApplicationRecord
  has_many :products
  has_many :users, -> { distinct }, through: :products

  validates :name, presence: true, uniqueness: true
end
