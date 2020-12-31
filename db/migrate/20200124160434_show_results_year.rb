class ShowResultsYear < ActiveRecord::Migration[5.2]
  def change
    add_column :years, :show_results, :boolean, default: 0
  end
end
