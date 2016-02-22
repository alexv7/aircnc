class CreateOwnertimes < ActiveRecord::Migration
  def change
    create_table :ownertimes do |t|
      
      t.timestamps null: false
    end
  end
end
