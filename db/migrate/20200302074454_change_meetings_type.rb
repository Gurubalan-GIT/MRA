class ChangeMeetingsType < ActiveRecord::Migration[6.0]
  def change
    remove_column :meetings, :start_time
    remove_column :meetings, :end_time
  end
end
