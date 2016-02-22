class AddProfilePicToProperty < ActiveRecord::Migration
  def change
    add_attachment :properties, :profile_pic
  end
end
