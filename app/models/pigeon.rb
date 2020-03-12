# frozen_string_literal: true

class Pigeon < ApplicationRecord
  belongs_to :user
  has_many :journeys, dependent: :destroy
  validates :name, presence: true
  validates :breed, presence: true
  validates :km_per_hour, presence: true
  validates :price_per_km, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
