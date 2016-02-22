class CreatePropertyRentalRequests < ActiveRecord::Migration
  def change
    create_table :property_rental_requests do |t|

      t.timestamps null: false
    end
  end
end
