class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(12).order('created_at DESC')
  end

  def check
    users = User.pluck("email")
    render json: { users: users }
  end
end
