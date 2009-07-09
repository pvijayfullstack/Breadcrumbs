class AddProjectKey < ActiveRecord::Migration
  def self.up
      add_column :projects, :key, :string
  end

  def self.down
    remove_column :projects, :key
  end
end
