class Account < ApplicationRecord
  has_many :transactions

  validates :name, presence: true, length: { minimum: 3, maximun: 100 }
  validates :balance, presence: true, numericality: true
  default_scope { order(balance: :desc) }
end
