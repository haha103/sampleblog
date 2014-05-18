class AddPostCountToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :post_count, :integer
  end
end
