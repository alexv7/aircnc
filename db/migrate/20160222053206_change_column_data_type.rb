class ChangeColumnDataType < ActiveRecord::Migration
  def change
    change_column :properties, :name, :text
  end
end
