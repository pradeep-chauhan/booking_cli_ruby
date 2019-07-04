class ChangeColumnTypeToSeatTypeInSeats < ActiveRecord::Migration[5.2]
  def change
    remove_column :seats, :type
    add_column :seats, :entity_type, :string
  end
end
