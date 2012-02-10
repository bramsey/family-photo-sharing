class Comment < ActiveRecord::Base
  
  belongs_to :pictures
  
  has_one :user
  
  validates :content, :presence => true
  validates :user_id, :presence => true
  
  attr_accessible :content
  
end
