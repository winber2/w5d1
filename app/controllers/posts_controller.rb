class PostsController < ApplicationController
  before_action :require_login

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save

      params[:post][:sub_ids].each do |sub_id|
        Postsub.create!(post_id: @post.id, sub_id: sub_id)
      end

      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    render :edit
  end

  def update
    @post = Post.find_by(id: params[:id])

    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @all_comments = @post.comments_by_parent_id
    render :show
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to post_url(@post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :url, sub_ids: [])
  end
end
