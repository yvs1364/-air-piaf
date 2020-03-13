# frozen_string_literal: true

class Journey < ApplicationRecord
  belongs_to :user
  belongs_to :pigeon
  validates :arrival_address, presence: true
  validates :message, presence: true
  validates :return_date, presence: true
  geocoded_by :arrival_address
  after_validation :geocode, if: :will_save_change_to_arrival_address?
end
