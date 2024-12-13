class PhotosController < ApplicationController
  before_action :require_login, except: [:index, :show]

  def index
    @photos = Photo.public_photos
    @photo = current_user.photos.build if logged_in?
  end

  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      redirect_to photos_path, notice: "Photo added successfully."
    else
      @photos = Photo.public_photos
      flash.now[:alert] = "Failed to add photo."
      render :index
    end
  end

  def show
    @photo = Photo.find(params[:id])
    @comment = Comment.new
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :caption)
  end
end
