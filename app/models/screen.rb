class Screen < ApplicationRecord
  include SeatAttributes
  has_many :seats
  validates :name, presence: true, uniqueness: {case_insensitive: true}

  def platinum_seats
    self.seats.where(entity_type: PLATINUM)
  end

  def gold_seats
    self.seats.where(entity_type: GOLD)
  end

  def silver_seats
    self.seats.where(entity_type: SILVER)
  end
end