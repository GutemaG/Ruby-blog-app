class UsersController < ApplicationController
  def index
    @users = User.includes(posts: %i[comments likes])
  end

  def show
    @user = User.find(params[:id])
  end
end
