class CreateFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
