require "Gosu"
require_relative 'z_order'
require_relative 'spaceship'
class Timer
	attr_reader :time_left

	def initialize(player)
		@time_left = 150

		@player = player
	end

	def print_out
		if @time_left > 1
			@time_left -= 0.01
			"Time left: #{@time_left.truncate}"
		else
			"GAME OVER"
		end
	end

	def game_over?
		@time_left <= 1
		
	end

end