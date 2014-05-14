class CreateBoardsLabels < ActiveRecord::Migration
  def change
    create_table :boards_labels, :id => false do |t|
			t.references :board
			t.references :label
    end
  end

	def self.down
		drop_table :boards_labels
	end
end
