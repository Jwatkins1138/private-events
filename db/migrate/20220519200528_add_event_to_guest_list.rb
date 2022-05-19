class AddEventToGuestList < ActiveRecord::Migration[7.0]
  def change
    add_reference :guest_lists, :event, null: false, foreign_key: true
  end
end
