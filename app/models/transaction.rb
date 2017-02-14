class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :category, optional: true

  validates :import, presence: true, numericality: true
  validates :description, presence: true, length: { minimum: 3 }
  default_scope { order(created_at: :desc) }

  after_create :refresh_balance

  private
  def refresh_balance
    account.update_attribute(:balance, account.balance + import)
  end
end
