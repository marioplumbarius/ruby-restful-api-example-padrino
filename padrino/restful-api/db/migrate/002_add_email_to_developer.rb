class AddEmailToDeveloper < ActiveRecord::Migration
  def self.up
    add_column :developers, :email, :string
  end

  def self.down
    remove_column :developers, :email, :string
  end
end
