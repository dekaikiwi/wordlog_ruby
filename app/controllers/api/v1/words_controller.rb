class Api::V1::WordsController < ApplicationController
  before_action :authenticate_with_token!, only: [:create]
  respond_to :json

  def index
    respond_with Word.all
  end

  def show
    respond_with Word.find(params[:id])
  end

  # TODO: Improve This!!
  def create
    word = current_user.words.build(word_params)
    if word.save
      list = List.find(params[:list_id])
      list.words << word
      if list.save
        render json: word, status: 201, location: [:api, word]
      end
    else
      render json: { errors: word.errors }, status: 422
    end
  end

  def word_params
    params.require(:word).permit(:target_word)
  end
end
