class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @posts = Post.includes(:movie)
    @genres = Genre.all.sort_by { |genre| genre.name }
    @movies = Movie.pluck(:title).sort
    if params[:genre].present?
      @posts = @posts.where(movies: {genre_id: params[:genre].to_i})
    end
    if params[:query].present?
      @posts = @posts.global_search(params[:query])
    end
  end

  def starreview

    case @post.rating
    when 1 
    when 2
    when 3
    when 4
    when 5
    end
  end

end
