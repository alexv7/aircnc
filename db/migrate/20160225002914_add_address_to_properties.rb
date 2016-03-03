class AddAddressToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :street_number, :string
    add_column :properties, :street_name, :string
    add_column :properties, :city, :string
    add_column :properties, :state, :string
    add_column :properties, :zip_code, :string
  end
end
