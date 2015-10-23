require "Gosu"
require_relative 'z_order'

class Bomb
	attr_reader :x, :y

 	def initialize(animation)
 		@animation = animation
 		@x = rand * 640
		@y = rand * 480
 	end

 	def draw
 		img = @animation[0]
 		img.draw(@x, @y, ZOrder::BOMB)
 	end
 	
 	

 end 