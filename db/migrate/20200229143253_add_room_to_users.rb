class AddRoomToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :room, null: false, foreign_key: true
  end
end
