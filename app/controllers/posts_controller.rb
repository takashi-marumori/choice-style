class PostsController < ApplicationController
  before_action :search_post, only: [:index, :search]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def search
    @results = @p.result.order('RAND()').limit(1)
  end

  private

  def post_params
    params.require(:post).permit(:memo, :clothes_id, :season_id, :gender_id, :image).merge(user_id: current_user.id)
  end

  def search_post
    @p = Post.ransack(params[:q])
  end
end
