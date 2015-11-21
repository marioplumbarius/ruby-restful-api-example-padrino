class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.integer :kind
      t.date :release_date
      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
