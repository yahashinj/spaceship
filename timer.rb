require "Gosu"

class Timer

	def intitialize
		@time = 3
	end
	def update
		time -= 0.01
		print time
	end


	def time
		@time
	end
end