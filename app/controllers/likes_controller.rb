class LikesController < ApplicationController
  before_action :require_login

  def create
    @photo = Photo.find(params[:photo_id])
    unless @photo.likes.exists?(user: current_user)
      @photo.likes.create!(user: current_user)
    end
    redirect_to photo_path(@photo), notice: "Photo liked successfully."
  end

  def destroy
    @photo = Photo.find(params[:photo_id])
    like = @photo.likes.find_by(user: current_user)
    like&.destroy
    redirect_to photo_path(@photo), notice: "Like removed successfully."
  end
end
