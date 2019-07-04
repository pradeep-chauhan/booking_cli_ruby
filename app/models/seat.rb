class Seat < ApplicationRecord
  include SeatAttributes
  belongs_to :screen
  has_and_belongs_to_many :bookings
  validates :number, :screen_id, presence: true
  validates :entity_type, presence: true, inclusion: TYPES
end