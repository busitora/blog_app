class PostsController < ApplicationController
  before_action :set_post, only: [ :show, :edit, :update, :destroy]

  def index
    @q = Post.order(created_at: :desc).ransack(params[:q])
    @posts = @q.result.page(params[:page]).per(2)
    @new_posts = Post.find_newest_article
    @author = Author.first
  end

  def show
  end

  def new
    @post = Post.new # フォーム用の空のインスタンスを生成する。
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to @post 
  end 

  def edit
  end

  def update
    redirect_to @post
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
