class AddColumnsToRequest < ActiveRecord::Migration
  def change
    add_column :rental_requests, :user_id, :integer
    add_column :rental_requests, :property_id, :integer
    add_column :rental_requests, :start_date, :datetime
    add_column :rental_requests, :end_date, :datetime
  end
end
