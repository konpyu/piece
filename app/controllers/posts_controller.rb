class PostsController < ApplicationController
  before_filter :authenticate

  def new
    @posts = current_user.posts.build
  end

  def index
  end

  def destroy
    @posts = current_user.posts.find(params[:id])
    @posts.destroy!
    redirect_to root_path, notice: '削除しました'
  end

  def create
    @posts = current_user.posts.build(post_params)
    @posts.number = Post.where(user_id: current_user).maximum(:number) + 1
    if @posts.save
      redirect_to root_path, notice: 'OK'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

end
