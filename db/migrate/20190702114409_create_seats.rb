class CreateSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :seats do |t|
      t.string :number
      t.string :type
      t.integer :screen_id

      t.timestamps
    end
  end
end
