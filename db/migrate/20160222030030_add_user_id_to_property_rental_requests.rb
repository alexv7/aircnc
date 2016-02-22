class AddUserIdToPropertyRentalRequests < ActiveRecord::Migration
  def change
    add_column :property_rental_requests, :user_id, :integer
  end
end
