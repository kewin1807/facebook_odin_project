class AddStatusColumnNoitification < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :was_read, :boolean
  end
end
