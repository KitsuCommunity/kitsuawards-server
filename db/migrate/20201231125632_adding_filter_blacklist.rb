class AddingFilterBlacklist < ActiveRecord::Migration[5.2]
  def change
    add_column :blacklists, :verified, :boolean
  end
end
