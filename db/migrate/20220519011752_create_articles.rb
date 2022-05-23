class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :slug, null: false
      t.string :title
      t.text :summary
      t.text :body, null: false
      t.boolean :published, null: false, default: true
      t.boolean :private, null: false, default: false
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :site, null: false, foreign_key: true

      t.date :published_on, null: true
      t.timestamps
    end

    add_index :articles, :slug
    add_index :articles, [:slug, :published_on], unique: true
  end
end
