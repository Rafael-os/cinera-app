class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @posts = Post.includes(:movie)
    @genres = Genre.all.sort_by { |genre| genre.name }
    @movies = Movie.pluck(:title).sort
    if params[:genre] 
      @posts = @posts.where(movies: {genre_id: params[:genre].to_i})
    end
    if params[:query]
      @posts = @posts.global_search(params[:query])
    end
  end

end
