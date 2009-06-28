class CreateBreadcrumbs < ActiveRecord::Migration
  def self.up
    create_table :breadcrumbs do |t|
      t.string :name
      t.text :notes
      t.integer :status_id
      t.integer :task_id

      t.timestamps
    end
  end

  def self.down
    drop_table :breadcrumbs
  end
end
