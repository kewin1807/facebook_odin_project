class AddFriendColumWithReferenceToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :friendships, :friend_id, :uuid
    add_foreign_key :friendships, :users, column: :friend_id, type: :uuid
  end
end
