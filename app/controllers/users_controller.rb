class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user.id == current_user.id
      @posts = @user.posts.page(params[:page]).per(12).order('created_at DESC')
    else
      redirect_to root_path
    end
  end

  def check
    users = User.pluck('email')
    render json: { users: users }
  end
end
