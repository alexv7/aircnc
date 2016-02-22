class Property < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: :user_id, primary_key: :id
  has_many :property_rental_requests

  has_attached_file :profile_pic
  validates_attachment_content_type :profile_pic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
