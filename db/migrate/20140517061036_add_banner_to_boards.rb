class AddBannerToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :banner, :string
  end
end
