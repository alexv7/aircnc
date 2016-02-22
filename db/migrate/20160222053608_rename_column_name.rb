class RenameColumnName < ActiveRecord::Migration
  def change
    rename_column :properties, :name, :description
  end
end
