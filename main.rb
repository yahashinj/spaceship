require "gosu"
require_relative 'spaceship'
	class GameWindow < Gosu::Window
	
		def initialize
			super 640, 480
			self.caption = "Gosu Tutorial Game"

			@background_image = Gosu::Image.new("media/space.png", 
																					:tileable => true)
			@spaceship = Spaceship.new
			@spaceship.warp(width/2.0, height/2.0)
		end

		def update
			@spaceship.turn_left if Gosu::button_down? Gosu::KbLeft
			@spaceship.turn_right if Gosu::button_down? Gosu::KbRight
			@spaceship.accelerate if Gosu::button_down? Gosu::KbUp

			@spaceship.move
			
		end

		def draw
			@spaceship.draw
			@background_image.draw(0, 0 , ZOrder::BACKGROUND)
		end

		def button_down(id)
			close if id == Gosu::KbEscape
		end


	end

window = GameWindow.new
window.show