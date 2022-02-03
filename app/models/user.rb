class User < ApplicationRecord

  has_many :warehouses
  has_many :products, through: :warehouses

  validates_presence_of :email, :name
  validates_uniqueness_of :email

  validates :name, presence: true

  has_secure_password

  # validate :is_title_case
  
  # before_validation :make_title_case

end
