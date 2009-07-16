class AddItemIdToBreadcrumbs < ActiveRecord::Migration
  def self.up
     add_column :breadcrumbs, :item_id, :integer
  end

  def self.down
    remove_column :breadcrumbs, :item_id
  end
end
