class AddDateColumnOnBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :booked_on, :string
  end
end
