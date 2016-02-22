class AddPropertyIdToPropertyRentalRequests < ActiveRecord::Migration
  def change
    add_column :property_rental_requests, :property_id, :integer
  end
end
