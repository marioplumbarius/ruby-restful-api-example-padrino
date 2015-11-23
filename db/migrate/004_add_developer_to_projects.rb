class AddDeveloperToProjects < ActiveRecord::Migration
  def self.up
    add_reference :projects, :developer
  end

  def self.down
    remove_reference :projects, :developer
  end
end
