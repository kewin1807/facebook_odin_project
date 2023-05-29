class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts, id: :uuid do |t|
      t.text :content
      t.integer :num_likes

      t.timestamps
    end

    add_column :posts, :user_id, :uuid
    add_foreign_key :posts, :users, column: :user_id, type: :uuid
  end
end
