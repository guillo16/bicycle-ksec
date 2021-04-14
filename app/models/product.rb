class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :brand, presence: true
  validates :code, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
end
