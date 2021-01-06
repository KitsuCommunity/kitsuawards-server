class AddCategoryDate < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :start, :datetime
    add_column :categories, :end, :datetime
  end
end
