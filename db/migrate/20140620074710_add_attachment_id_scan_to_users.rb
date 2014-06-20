class AddAttachmentIdScanToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :id_scan
    end
  end

  def self.down
    drop_attached_file :users, :id_scan
  end
end
