class NotnullYearid < ActiveRecord::Migration[5.2]
  def change

    change_column :categories, :year_id, :bigint, null: false
    change_column :judges, :year_id, :bigint, null: false
    change_column :nominees, :subcategory_id, :bigint, null: false
    change_column :subcategories, :category_id, :bigint, null: false
    change_column :votes, :nominee_id, :bigint, null: false
    change_column :votes, :subcategory_id, :bigint, null: false

  end
end
