class CreateBlogpost < ActiveRecord::Migration
  def change
    create_table :blogposts do |t|
      t.string :title
      t.text :content
      t.references :user, index: true

      t.timestamps null: false
    end
    add_index :blogpost, [:user_id, :created_at]
  end
end
