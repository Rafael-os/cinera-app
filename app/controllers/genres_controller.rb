class GenresController < ApplicationController
  def index
    @genres = []
    @movies = Movie.all
    @movies.each do |movie|
      @genres << movie.genre
    end
    @genres.uniq
  end
end
