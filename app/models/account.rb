class Account < ApplicationRecord
  has_many :users, dependent: :destroy
  validates :name, presence: true

  def self.valid? payload
    return false if payload.blank?
    true
  end
end
