class AddUserColumnNotification < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :user_id, :uuid
    add_foreign_key :notifications, :users, column: :user_id, type: :uuid
  end
end
