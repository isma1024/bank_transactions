class Category < ApplicationRecord
  has_many :transactions

  validates :name, presence: true, length: { minimum: 3 }
end
