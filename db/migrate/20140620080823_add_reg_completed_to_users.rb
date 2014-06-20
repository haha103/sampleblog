class AddRegCompletedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :reg_completed, :boolean
  end
end
