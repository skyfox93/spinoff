class Api::V1::FriendshipsController < ApplicationController
  def create
    id1=friend_params[:follower_id]
    id2=friend_params[:followee_id]
    @newF=Friendship.create(follower_id:id1, followee_id:id2)
      if @newF
        render json: @newF,status: :ok
      else
        render json:@newF.errors, status: :unprocessable_entity
      end
  end


  def accept
    id1=friend_params[:follower_id]
    id2=params[:user_id]
    @friendship=Friendship.find_by(follower_id:id1,followee_id:id2)
    @friendship.update(friend_params)
    render json: @friendship, status: :ok
  end

  private

  def follower_id
    friend_params[:follower_id]
  end


  def friend_params
    params.require(:friendship).permit(:followee_id, :follower_id,:accepted)
  end



end
