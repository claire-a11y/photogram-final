class CommentsController < ApplicationController
  before_action :require_login

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to photo_path(@photo), notice: "Comment added successfully."
    else
      flash[:alert] = "Failed to add comment."
      redirect_to photo_path(@photo)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      redirect_to photo_path(@comment.photo), notice: "Comment deleted successfully."
    else
      redirect_to photo_path(@comment.photo), alert: "You're not authorized to delete this comment."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
