class RenameDatabase < ActiveRecord::Migration[5.2]
  def change
    rename_column :nominees, :subcategorie_id, :subcategory_id
    rename_column :subcategories, :categorie_id, :category_id
    rename_column :votes, :subcategorie_id, :subcategory_id
  end
end
