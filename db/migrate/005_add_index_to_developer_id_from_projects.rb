class AddIndexToDeveloperIdFromProjects < ActiveRecord::Migration
  def self.up
    add_index :projects, :developer_id
  end

  def self.down
    drop_index :projects, :developer_id
  end
end
