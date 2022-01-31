class User < ApplicationRecord
  has_many :warehouses
  has_many :products, through: :warehouses

  validates_presence_of :email, :name
  validates_uniqueness_of :email

  validates :name, presence: true

  has_secure_password
end
