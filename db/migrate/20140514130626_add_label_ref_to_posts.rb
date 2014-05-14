class AddLabelRefToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :label, index: true
  end
end
