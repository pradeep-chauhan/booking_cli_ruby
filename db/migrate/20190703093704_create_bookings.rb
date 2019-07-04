class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.text :seats, array: true, default: []
      t.decimal :amount, :precision => 32, :scale => 16
      t.integer :screen_id
      t.decimal :service_tax, :precision => 32, :scale => 16
      t.decimal :swachh_bharat_cess, :precision => 32, :scale => 16
      t.decimal :krishi_kalyan_cess, :precision => 32, :scale => 16

      t.timestamps
    end
  end
end
