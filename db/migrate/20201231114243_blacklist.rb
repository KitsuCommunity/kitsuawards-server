class Blacklist < ActiveRecord::Migration[5.2]
  def change
    remove_column :votes, :verified
    create_table :blacklists do |t|
      t.integer :user_id,           null: false
      t.string  :username,          null: false
      t.boolean :acc_too_recent,    default: false
      t.boolean :acc_not_enough_entries, default: false
      t.boolean :acc_non_verified_email, default: false
      t.boolean :acc_default_pfp, default: false
    end
  end
end
