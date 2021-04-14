class User < ApplicationRecord
  acts_as_token_authenticatable

  has_many :categories, dependent: :destroy
  has_many :products, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
