class AddTimezoneStart < ActiveRecord::Migration[5.2]
  def change
    
    change_column :years, :start, :timestamp, null: false
    change_column :years, :end, :timestamp, null: false

  end
end
