class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string  :description
      t.integer :project_id
      t.text    :notes
      t.integer :priority_id
      t.integer :status_id
      t.integer :parent_id
      t.integer :effort_id
      t.string  :type

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
