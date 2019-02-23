class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), token: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def show
    @user=User.find(params[:id])
    render json: @user, status: :ok
  end

  def search
    @user=User.find(params[:id])
    @search_results=User.search(params[:id],params[:name])
    render json: @search_results, serializer: SearchResultsSerializer
  end

  def update
    @user=User.find(params[:id])
    @user.update(user_params)
    render json: @user
  end

  def feed
    @user=User.find(params[:user_id])
    @feed=@user.feed
    render :json => @feed
  end

  def profile_photos
    @user=User.find(params[:user_id])
    @photos=@user.owned_photos
    render json: {user: @user,photos: @photos}, serializer: ProfileSerializer
  end

  def following
    @user=User.find(params[:user_id])
    @following=@user.really_following
    render :json => @following
  end

  def user_params
    params.require(:user).permit(:id,:username, :displayname, :password,:bio,:avatar)
  end

end
