class PostsController < ApplicationController

  def index
    @posts = Post.all
    @new_posts = Post.all
    @author = Author.first
  end

  def show
    @post = Post.find(params[:id]) 
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
    @post = Post.find(params[:id]) 
  end

  def update
    @post = Post.find(params[:id])
    @post = Post.find(params[:id])
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category)
  end

end
