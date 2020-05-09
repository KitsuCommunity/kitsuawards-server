class RemoveSubcategoriesYear < ActiveRecord::Migration[5.2]
  def change
    remove_column :subcategories, :year_id
  end
end
