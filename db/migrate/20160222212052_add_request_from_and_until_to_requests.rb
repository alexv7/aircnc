class AddRequestFromAndUntilToRequests < ActiveRecord::Migration
  def change
    add_column :property_rental_requests, :request_date_from, :datetime
    add_column :property_rental_requests, :request_date_until, :datetime
  end
end
