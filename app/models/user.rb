class User < ApplicationRecord
  has_many :products 
  has_many :warehouses, -> { distinct } ,through: :products
end
