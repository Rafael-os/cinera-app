class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts = Post.search(params[:search])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params) 
    @post.user = current_user
    @post.movie = Movie.find_by(title: params[:post][:movie_id])
    @post.save
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(params[:post])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :post_id, :comment, :rating)
  end
end
