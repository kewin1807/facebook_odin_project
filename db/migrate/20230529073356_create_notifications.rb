class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.text :content
      t.uuid :notificationable_id
      t.string :notificationable_type
      
      t.timestamps
    end
  end
end
