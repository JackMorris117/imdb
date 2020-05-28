require_relative('models/casting')
require_relative('models/movie')
require_relative('models/star')

require('pry-byebug')
Star.delete_all

star1 = Star.new({ 'first_name' => 'Chris', 'last_name' => 'Evans' })
star1.save
star2 = Star.new({ 'first_name' => 'Robert', 'last_name' => 'Downey Jr' })
star2.save
star3 = Star.new({ 'first_name' => 'Paul', 'last_name' => 'Rudd' })
star3.save










binding.pry
nil