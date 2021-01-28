class PostsController < ApplicationController
  before_action :search_post, only: [:index, :search, :search_index, :search_result]

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    binding.pry
    if @post.valid?
      @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.all
    binding.pry
  end

  def update
    @post = Post.find(params[:post_id])
    if @post.update(post_params)
      redirect_to post_path
    else
      render :edit
    end
  end

  def search
    @results = @p.result.order('RAND()').limit(1)
  end

  def search_index
    @post = Post.all
  end

  def search_result
    @post = Post.all
    @results = @p.result
  end

  private

  def post_params
    params.require(:post).permit(:memo, :clothes_id, :season_id, :gender_id, :image).merge(user_id: current_user.id)
  end

  def search_post
    @p = Post.ransack(params[:q])
  end
end
