class AddDescToYear < ActiveRecord::Migration[5.2]
  def change

    add_column :years, :description, :string

  end
end
