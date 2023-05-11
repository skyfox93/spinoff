class Api::V1::PhotosController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]

  def show
    @photo=Photo.find(params[:id])
    render json: @photo
  end
  
  def index
    offest = params[:offset]
    limit = params[:limit]
    @photos  = Photo.add_spinoff_counts(Photo.include_relations.order(created_at: :desc).limit(limit).offset(offest))
    render json: @photos
  end
  
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
    if @photo.user == current_user
      if @photo.update(photo_params)
        render json: @photo
      else
        render json: @photo.errors, status: :unprocessable_entity
      end
    else
      render json: @photo, status: :unauthorized
    end
  end

  
  def delete
    photo = Photo.find(params[:id])
    if @photo.user == current_user
      if photo.valid?
        photo.delete!
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
      end
    else
      render json:  @photo, status: :unauthorized
    end
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:user_id, :photo_id,:like_count,:file)
  end
end
