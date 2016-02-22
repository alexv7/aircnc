class AddTimesToOwnertime < ActiveRecord::Migration
  def change
    add_column :ownertimes, :owner_date_from, :datetime
    add_column :ownertimes, :owner_date_until, :datetime
  end
end
