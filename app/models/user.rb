class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable
  
  has_many :pictures, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_one :avatar, :dependent => :destroy
  
  default_scope :order => 'users.created_at ASC'

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  
  def avatar_path
    avatar ? avatar.file_url : 'default_ava.png'
  end
  
  def avatar_thumb_path
    avatar ? avatar.file_url(:thumb) : 'default_ava_thumb.png'
  end
  
end
