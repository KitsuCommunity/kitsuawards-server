class Remove < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :status
    remove_column :judges, :status
    remove_column :nominees, :status
    remove_column :subcategories, :status
    remove_column :years, :status
  end
end
