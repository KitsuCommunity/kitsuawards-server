class Removesubcatid < ActiveRecord::Migration[5.2]
  def change

    remove_column :votes, :subcategory_id

    change_column :categories, :url, :string, null: false
    change_column :years, :description, :string, null: false
    change_column :categories, :url, :string, null: false

  end
end
