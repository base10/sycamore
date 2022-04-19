class CreateSites < ActiveRecord::Migration[7.0]
  def change
    create_table :sites do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.text :description

      t.timestamps
    end

    add_index :sites, :name, unique: true
    add_index :sites, :url, unique: true
  end
end
