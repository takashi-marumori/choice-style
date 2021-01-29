class PostsController < ApplicationController
  before_action :search_post, only: [:index, :search, :search_edit, :search_edit_result, :search_show, :search_show_result]

  def index
    @posts = Post.find_by_id(params[:id])
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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  def search
    @results = @p.result.order('RAND()').limit(1)
  end

  def show
  end

  def search_edit
    @post = Post.find_by_id(params[:id])
  end

  def search_edit_result
    @post = Post.find_by_id(params[:id])
    @results = @p.result
  end

  def search_show
    @post = Post.find_by_id(params[:id])
  end

  def search_show_result
    @post = Post.find_by_id(params[:id])
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
