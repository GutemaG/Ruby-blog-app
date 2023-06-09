class Api::PostsController < Api::ApplicationController
  def index
    posts = Post.where(author_id: params[:user_id])
    render json: posts, status: :ok
  end

  def show
    post = Post.where(id: params[:id])
    render json: post, status: :ok
  end
end
