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
    @comment = Comment.new(comment_params) 
    @comment.user = current_user
    @comment.post = Post.last
    if @comment.save
      render :index
    else
      render :new
    end
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

  def comment_params
    params.require(:comment).permit(:content)
  end

end
