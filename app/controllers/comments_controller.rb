class CommentsController < ApplicationController
  before_action :require_login

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.user_id = current_user.id if current_user

    if @comment.save
      redirect_to post_url(@comment.post_id)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to post_url(@comment.post_id)
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    redirect_to post_url(@comment.post_id)
  end

  def new
    @comment = Comment.new
    render :new
  end

  def show
    @comment = Comment.find_by(id: params[:id])
    @all_comments = Post.find_by(id: @comment.post_id).comments_by_parent_id
    render :show
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :comment_id)
  end

end
