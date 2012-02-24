class CommentsController < ApplicationController
  before_filter :authenticate_user!
  
  respond_to :html, :js
  
  def create
    @comment  = current_user.comments.build(params[:comment])
    @comment.save ?
      flash.now[:notice] = 'Thanks for commenting!' :
      flash.now[:alert] = 'could not save comment :('
    
    respond_with @comment
  end
  
  
  def destroy
    
    @comment = Comment.find(params[:id])
    @comment.destroy

    @comment.destroy ?
      flash.now[:notice] = 'Comment deleted.' :
      flash.now[:alert] = 'Could not remove comment :('
    
    respond_with @comment
  end
  
end
