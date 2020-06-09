# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Movie.destroy_all if Rails.env.development?
Movie.create!({title:"Scarface", year:"1983", avg_rating:4, url:"www.scarface.com"})
Post.create!({movie_id: Movie.all.sample.id,user_id: User.all.sample.id ,comment: "Filme bom pakas, recomendo demais. Aposto que o @BrunoTostes vai dormir", rating: 5})
