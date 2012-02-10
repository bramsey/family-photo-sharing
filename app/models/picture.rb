class Picture < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  validates_presence_of :file
  mount_uploader :file, ImageUploader
  
  default_scope :order => 'pictures.created_at DESC'
  
  belongs_to :user
  has_many :comments, :dependent => :destroy
  
  #one convenient method to pass jq_upload the necessary information
  def to_jq_upload
  {
    "id" => read_attribute(:id),
    "name" => read_attribute(:file),
    "size" => file.size,
    "url" => file.url,
    "thumbnail_url" => file.thumb.url,
    "delete_url" => picture_path(:id => id),
    "delete_type" => "DELETE" 
   }
  end
  
  def self.todays_pictures
    pictures = Picture.all.collect {|picture| picture if (picture.created_at.day == (Time.now.day - 1)) && ((Time.now - picture.created_at) < 172800)}.compact
  end
  
  def self.old_pictures
    pictures = Picture.all.collect {|picture| picture if (Time.now - picture.created_at) > 172800}.compact
  end
end
