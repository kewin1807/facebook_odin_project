class AddIndexReaction < ActiveRecord::Migration[7.0]
  def change
    add_index :reactions, %i[user_id post_id], unique: true
  end
end
