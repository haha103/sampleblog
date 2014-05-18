class AddCommentCountToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :comment_count, :integer
  end
end
