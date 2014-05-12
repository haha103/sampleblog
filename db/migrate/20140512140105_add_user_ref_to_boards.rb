class AddUserRefToBoards < ActiveRecord::Migration
  def change
    add_reference :boards, :moderator, index: true
  end
end
