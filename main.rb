require "gosu"
require_relative 'spaceship'
require_relative 'stars'
require_relative 'bomb'
require_relative 'timer'
require_relative 'z_order'
	class GameWindow < Gosu::Window
		
		

		def initialize
			super 640, 480
			self.caption = "Gosu Tutorial Game"

			@background_image = Gosu::Image.new("media/background-halloween.png", 
																					:tileable => true)
			@spaceship = Spaceship.new
			@spaceship.warp(width/2.0, height/2.0)

			@star_anim = Gosu::Image::load_tiles("media/apple.png", 144, 194)
			@stars = Array.new

			@bomb_anim = Gosu::Image::load_tiles("media/pumpkin.png", 150, 150)
			@bombs = Array.new
			@timer = Timer.new(@spaceship)
			@font = Gosu::Font.new(20)
		end

		def update
			# return if @timer.game_over?
			# return if @player.death?

			@spaceship.turn_left if Gosu::button_down? Gosu::KbLeft
			@spaceship.turn_right if Gosu::button_down? Gosu::KbRight
			@spaceship.accelerate if Gosu::button_down? Gosu::KbUp

			@spaceship.move
			@spaceship.collect_stars(@stars)
			@spaceship.touching_bomb?(@bombs)

			if rand(100) < 5 && @stars.size < 10000
				@stars.push(Star.new(@star_anim))
			end

			if rand(500) < 1 && @bombs.size < 25
				@bombs.push(Bomb.new(@bomb_anim))
			end



		end

		def draw
			@spaceship.draw
			@background_image.draw(0, 0 , ZOrder::BACKGROUND)
			@stars.each { |star| star.draw }
			@bombs.each { |bomb| bomb.draw }

			@font.draw("Score: #{@spaceship.score}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xff_ffff00)
			@font.draw("#{@timer.print_out}", 100, 10, ZOrder::UI, 1.0, 1.0, 0xff_ffff00)
			@font.draw("#{@spaceship.health}", 400, 10, ZOrder::UI, 1.0, 1.0, 0xff_ffff00)
		end

		def button_down(id)
			close if id == Gosu::KbEscape
		end

		


	end

window = GameWindow.new
window.show
