class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    @like.author = current_user
    @like.id = rand(1000)

    redirect_back(fallback_location: root_path) if @like.save
  end

  private

  def like_params
    params.permit(:author_id, :post_id)
  end
end
