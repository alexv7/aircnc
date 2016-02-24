class AddPriceToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :room_type, :string
    add_column :properties, :price, :float

  end
end
