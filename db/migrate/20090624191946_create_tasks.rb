class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :name
      t.integer :project_id
      t.text :notes
      t.integer :priority
      t.integer :status_id
      t.integer :parent

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
