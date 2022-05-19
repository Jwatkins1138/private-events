class CreateGuestLists < ActiveRecord::Migration[7.0]
  def change
    create_table :guest_lists do |t|

      t.timestamps
    end
  end
end
