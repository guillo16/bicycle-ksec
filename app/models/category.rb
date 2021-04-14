class Category < ApplicationRecord
  belongs_to :user
  has_many :products

  validates :name, presence: true
  validates :brand, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
end
