class Api::V1::ListsController < ApplicationController
  before_action :authenticate_with_token!, only: [:create]
  respond_to :json

  def index
    respond_with List.all
  end

  def show
    respond_with List.find(params[:id])
  end

  def create
    list = current_user.lists.build(params)
    if list.save
      render json: list, status: 201, location: [:api, list]
    else
      render json: { errors: list.errors }, status: 422
    end
  end

  def list_params
    params.require(:list).permit(:title)
  end
end
