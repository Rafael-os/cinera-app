class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comments = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment]) 
    @comment.user = current_user
    @comment.movie = Movie.find(params[:movie_id])
    @comment.save
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(params[:comment])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to comments_path
  end
end
