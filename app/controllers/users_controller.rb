class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id], :include => [:pictures, {:pictures => :comments}])
    
    @pictures = @user.pictures
  end
  
end
