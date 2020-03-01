class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.string :name
      t.date :date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
