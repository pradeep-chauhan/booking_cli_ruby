class Booking < ApplicationRecord
  belongs_to :screen
  has_and_belongs_to_many :seats
  validates :screen_id, :seat_ids, :amount, presence: true

  def total_amount
    amount + service_tax + swachh_bharat_cess + krishi_kalyan_cess
  end

  def self.booked_seats screen_id
    bookings = Booking.where(screen_id: screen_id, booked_on: Date.today.to_s)
    booked_seats = []
    bookings.each do | booking|
      booked_seats << booking.seats.pluck(:id)
    end
    booked_seats.flatten!
  end
end