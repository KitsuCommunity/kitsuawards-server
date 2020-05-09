class BaseData < ActiveRecord::Migration[5.2]
  def change
    create_table :years do |t|
      t.boolean :status,            null: false, default: 0
      t.datetime :start,            null: false
      t.datetime :end,              null: false
    end

    create_table :categories do |t|
      t.boolean :status,            null: false, default: 0
      t.string :name,               null: false
      t.belongs_to :year,           foreign_key: true
    end

    create_table :subcategories do |t|
      t.boolean :status,            null: false, default: 0
      t.string :name,               null: false
      t.belongs_to :categorie,           foreign_key: true
      t.belongs_to :year,           foreign_key: true
    end

    create_table :nominees do |t|
      t.boolean :status,            null: false, default: 0
      t.belongs_to :subcategorie,   foreign_key: true
      t.string :name,               null: false
      t.string :media,              null: false
    end

    create_table :votes do |t|
      t.datetime :date,             null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.integer :user_id,           null: false
      t.belongs_to :subcategorie,   foreign_key: true
      t.belongs_to :nominee,        foreign_key: true
    end

    create_table :judges do |t|
      t.boolean :status,            null: false, default: 0
      t.integer :user_id,           null: false
      t.belongs_to :year,           foreign_key: true
    end

  end
end
