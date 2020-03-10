class Journey < ApplicationRecord
  belongs_to :user
  belongs_to :pigeon
  validates :arrival_address, presence: true
  validates :message, presence: true
  validates :arrival_date, presence: true
end
