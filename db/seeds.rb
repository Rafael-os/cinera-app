# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "json"
require 'open-uri'
require "pry"

movies = ["Scarface", "Point Break", "The Exorcist", "Rocky", "First Blood", "The Lord of the Rings", "The Godfather", "The Good, the Bad and the Ugly", "Green Street Hooligans", "Psycho" ]

def create_url(movie_name)  

  "http://www.omdbapi.com/?&t=#{movie_name}&apikey=#{ENV["OMDB"]}"

end

Movie.destroy_all
Genre.destroy_all

movies.each do |movie_name|
  movie_url = create_url(movie_name)
  response = open(movie_url).read
  movie_post = JSON.parse(response)
  p movie_post["Genre"]
  genre = Genre.find_by(name: movie_post["Genre"].split(", ").first)
  if genre.nil?
    genre = Genre.create!(name: movie_post["Genre"].split(", ").first)
  end
  movie = Movie.new(
    title: movie_post["Title"],
    director: movie_post["Director"],
    year: movie_post["Year"],
    poster: movie_post["Poster"],
    genre: genre
  )
  movie.save
  puts "#{movie.title} #{movie.director} #{movie.year} #{movie.poster} #{movie.genre.name}"
end
