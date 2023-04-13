class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.post = @post
    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Commented!'
    else
      render :new
    end
  end

  def destroy 
    @comment = Comment.find(params[:id]).destroy
    redirect_back_or_to user_posts_path(current_user), notice: 'Comment Deleted Successfully'
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end