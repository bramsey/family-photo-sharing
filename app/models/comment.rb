class Comment < ActiveRecord::Base
  
  belongs_to :picture
  
  belongs_to :user
  
  validates :content, :presence => true
  validates :user_id, :presence => true
  validates :picture_id, :presence => true
  
  attr_accessible :content, :user_id, :picture_id
  
end
