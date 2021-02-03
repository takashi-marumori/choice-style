class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :search_post,
                only: [:index, :search, :search_edit, :search_edit_result, :search_show, :search_show_result, :search_destroy,
                       :search_destroy_result]
  before_action :set_post, only: [:edit, :update, :show]
  before_action :set_post_by_id,
                only: [:index, :search_edit, :search_edit_result, :search_show, :search_show_result, :search_destroy, :search_destroy_result,
                       :destroy]
  before_action :search_result, only: [:search_edit_result, :search_show_result, :search_destroy_result]
  before_action :kaminari, only: [:search_edit_result, :search_show_result, :search_destroy_result]

  def index
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
  end

  def update
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    @post.destroy
    redirect_to root_path
  end

  def search
    @results = @p.result.order('RAND()').limit(1)
  end

  def search_edit
  end

  def search_edit_result
  end

  def search_show
  end

  def search_show_result
  end

  def search_destroy
  end

  def search_destroy_result
  end

  private

  def post_params
    params.require(:post).permit(:memo, :clothes_id, :season_id, :gender_id, :image).merge(user_id: current_user.id)
  end

  def search_post
    @p = Post.ransack(params[:q])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_post_by_id
    @post = Post.find_by_id(params[:id])
  end

  def search_result
    @results = @p.result
  end

  def kaminari
    @post = Post.page(params[:page]).per(10)
  end
end
