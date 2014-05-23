class AddEmailAndMobileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :mobile, :string
  end
end
