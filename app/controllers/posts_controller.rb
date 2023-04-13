class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments, :author)
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.author = current_user
    @post.comments_counter = 0
    @post.likes_counter = 0
    @post.id = rand(1000)
    if @post.save
      redirect_to user_posts_path, notice: 'post Created Successfully'
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.comments.each(&:destroy)
    @post.likes.each(&:destroy)

    if @post.destroy
      redirect_to user_path(current_user), notice: 'Post Deleted Successfully'
    else
      flash.now[:error] = 'Error! Post Not deleted'
      render :show, status: :unprocessable_entity
    end
  end

  private

  def post_params
    @user = current_user
    params.require(:post).permit(:title, :text)
  end
end
