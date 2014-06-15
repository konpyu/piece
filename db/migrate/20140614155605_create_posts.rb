class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string  :color
      t.text    :body,     null: false
      t.timestamps
    end
    add_index :posts, :user_id
  end
end
