class Api::UsersController < Api::ApplicationController
  def index
    @users = User.includes(:posts)
    render json: @users, status: :ok
  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
  end
end
