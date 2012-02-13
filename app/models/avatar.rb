class Avatar < ActiveRecord::Base
  validates_presence_of :file
  mount_uploader :file, AvatarUploader
  
  belongs_to :user
end
