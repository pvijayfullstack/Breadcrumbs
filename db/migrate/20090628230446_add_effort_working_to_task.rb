class AddEffortWorkingToTask < ActiveRecord::Migration
  def self.up
     add_column :tasks, :effort_id, :integer
     add_column :tasks, :working, :boolean
  end

  def self.down
    remove_column :tasks, :effort_id
    remove_column :tasks, :working
  end
end
