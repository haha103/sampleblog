class AddBoardRefToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :board, index: true
  end
end
