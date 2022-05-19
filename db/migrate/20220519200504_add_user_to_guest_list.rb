class AddUserToGuestList < ActiveRecord::Migration[7.0]
  def change
    add_reference :guest_lists, :user, null: false, foreign_key: true
  end
end
