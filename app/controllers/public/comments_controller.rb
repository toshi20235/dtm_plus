class Public::CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path) 
    else
      redirect_back(fallback_location: root_path) 
    end
  end
  
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    user = User.find(comment.user.id)
    redirect_to admin_user_path(user.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content, :music_id)
  end
end
