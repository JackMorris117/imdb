require_relative('models/casting')
require_relative('models/movie')
require_relative('models/star')

require('pry-byebug')
Casting.delete_all
Movie.delete_all
Star.delete_all

star1 = Star.new({ 'first_name' => 'Chris', 'last_name' => 'Evans' })
star1.save
star2 = Star.new({ 'first_name' => 'Robert', 'last_name' => 'Downey Jr' })
star2.save
star3 = Star.new({ 'first_name' => 'Paul', 'last_name' => 'Rudd' })
star3.save

movie1 = Movie.new({'title' => 'Captain America', 'genre' => 'Action'})
movie1.save
movie2 = Movie.new({'title' => 'Iron Man', 'genre' => 'Super-hero'})
movie2.save
movie3 = Movie.new({'title' => 'Ant-Man', 'genre' => 'Heist'})
movie3.save

casting1 = Casting.new({ 'star_id' => star1.id, 'movie_id' => movie1.id, 'fee' => 10})
casting1.save
casting2 = Casting.new({ 'star_id' => star2.id, 'movie_id' => movie2.id, 'fee' => 9})
casting2.save
casting3 = Casting.new({ 'star_id' => star3.id, 'movie_id' => movie3.id, 'fee' => 20})
casting3.save



binding.pry
nil
