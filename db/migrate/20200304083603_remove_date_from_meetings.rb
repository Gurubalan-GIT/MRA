class RemoveDateFromMeetings < ActiveRecord::Migration[6.0]
  def change
    remove_column :meetings, :date
  end
end
