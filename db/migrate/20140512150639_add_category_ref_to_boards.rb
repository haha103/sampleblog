class AddCategoryRefToBoards < ActiveRecord::Migration
  def change
    add_reference :boards, :category, index: true
  end
end
