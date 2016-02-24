class CreateRentalRequests < ActiveRecord::Migration
  def change
    create_table :rental_requests do |t|
      

      t.timestamps null: false
    end
  end
end
