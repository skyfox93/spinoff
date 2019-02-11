class Api::V1::PhotosController < ApplicationController

  def index
    @user=User.find(params[:user_id])
    @photos = @user.photos
    render json:@photos
  end

  def show
    @photo=Photo.find(params[:id])
    render json: @photo
  end


  # ? post new puzzle?
  def create
    @photo = Photo.new(photo_params)
    @photo.file=params[:file] 
    if @photo.save
      render json: @photo, status: :created
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  def update
    set_photo
    if @photo.update(photo_params)
      render json: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  def delete
    params.permit(:id)
    @photo = Photo.find(params[:id])

    if @photo.valid?
      @photo.delete
      render json: { user: UserSerializer.new(current_user) }, status: :accepted
    else
      render json: {error: 'failed to create new photo'}, status: :unprocessable_entity
    end
  end





  private
  # Use callbacks to share common setup or constraints between actions.
  def set_photo
    @photo = Photo.find(params[:id])
  end


  def photo_params
    params.require(:photo).permit(:user_id, :photo_id,:like_count,:file)
  end
end
