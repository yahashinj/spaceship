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
 	
 	def explode
 		if should_explode
 			# img = @animation[Gosu::milliseconds / 1000 % @animation.size]
 			for n in 0..@animation.size
 				img = @animation[n]
 			end
 		end
 	end

 end 