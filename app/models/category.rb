class Category < ApplicationRecord
  belongs_to :user
  has_many :products

  validates :name, presence: true
  validates :code, presence: true
end
