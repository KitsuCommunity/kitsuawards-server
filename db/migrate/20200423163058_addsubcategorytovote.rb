class Addsubcategorytovote < ActiveRecord::Migration[5.2]
  def change
    add_column :votes, :verified, :boolean, default: 1
    add_reference :votes, :subcategories, index: true
  end
end
