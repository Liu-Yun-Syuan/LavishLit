class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    unless table_exists?(:posts)
      create_table :posts do |t|
        t.string :title
        t.text :content
        t.references :user, null: false, foreign_key: true

        t.timestamps
      end
      add_index :posts, :title, unique: true
    end
  end
end
