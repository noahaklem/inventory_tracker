class User < ApplicationRecord
  has_many :warehouses
  has_many :products, through: :warehouses
end
