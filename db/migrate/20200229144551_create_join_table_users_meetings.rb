class CreateJoinTableUsersMeetings < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :meetings do |t|
    t.index [:user_id, :meeting_id]
    t.index [:meeting_id, :user_id]
    end
  end
end
