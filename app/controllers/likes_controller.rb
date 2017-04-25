class LikesController < ApplicationController
  before_action :require_login

  def create
    @like = Like.new(like_params)

    if @like.save
      redirect_to :Back
    else
      flash[:errors] = ["You done fucked up my server"]
      redirect_to :back
    end
  end

  def destroy
    @like = Like.find_by(id: params[:id])
    @like.destroy if @like
    redirect_to :back
  end

  private

  def like_params
    params.require(:like).permit(:likeable_id, :likeable_type)
  end
end
