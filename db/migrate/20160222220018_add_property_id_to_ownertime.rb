class AddPropertyIdToOwnertime < ActiveRecord::Migration
  def change
    add_column :ownertimes, :property_id, :integer
  end
end
