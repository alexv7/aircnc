class AddColumnForRentToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :for_rent?, :boolean
  end
end
