class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.limit(10)
  end
end
