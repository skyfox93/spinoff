class Api::V1::UsersController < ApplicationController
  def create
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



end
