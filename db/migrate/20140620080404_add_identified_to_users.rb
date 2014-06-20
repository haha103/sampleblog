class AddIdentifiedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :identified, :boolean
  end
end
