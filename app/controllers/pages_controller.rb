class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @posts = Post.includes(:movie)
    @genres = Genre.all.sort_by { |genre| genre.name }
    if params[:genre] 
      @posts = @posts.where(movies: {genre_id: params[:genre].to_i})
    end
  end
end
