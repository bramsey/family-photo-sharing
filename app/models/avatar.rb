class Avatar < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  validates_presence_of :file
  mount_uploader :file, AvatarUploader
  
  belongs_to :user
  
  attr_accessible :file, :user_id
  
  def to_jq_upload
  {
    "id" => read_attribute(:id),
    "name" => read_attribute(:file),
    "size" => file.size,
    "url" => file.url,
    "thumbnail_url" => file.thumb.url,
    "delete_url" => avatar_path(:id => id),
    "delete_type" => "DELETE" 
   }
  end
end
