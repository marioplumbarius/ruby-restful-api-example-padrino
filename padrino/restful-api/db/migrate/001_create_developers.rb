class CreateDevelopers < ActiveRecord::Migration
  def self.up
    create_table :developers do |t|
      t.string :name
      t.integer :age
      t.string :github
      t.timestamps
    end
  end

  def self.down
    drop_table :developers
  end
end
