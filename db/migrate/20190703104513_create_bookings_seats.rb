class CreateBookingsSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings_seats do |t|
      t.integer :booking_id
      t.integer :seat_id
    end
  end
end
