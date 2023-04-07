class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = current_user.posts.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.post = current_user.posts.find(params['post_id'])
    @comment.id = rand(1000)
    if @comment.save
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
