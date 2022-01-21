class ProductWarehouse < ApplicationRecord
  belongs_to :product
  belongs_to :warehouse

  # def warehouse_location=(location)
  #   warehouse 
  # end
end
