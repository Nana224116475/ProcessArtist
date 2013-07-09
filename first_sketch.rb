require 'ruby-processing'

class FirstSketch < Processing::App
	def setup
		background(255, 0, 255)
	end

	def draw
		stroke(255, 255, 255)
		if @i.nil? || @i == 225
		
			@i = 0
		end
			@i = @i + 6
			fill(@i, 5*@i, 52)
		
		@i.times do |j|
			fill(rand(@i), rand(@i), rand(@i))
			rect(200, @i, 20, 200)
			oval(@i, 400, @i, 200)
			triangle(@i, 40, 200, @i, 30, 300)
		end
	end

	def run_command(command)
		puts "Running command #{command}"
		if command.start_with?("b")
			puts "we got a b"
			number = command[1..command.length-1]
			numbers = number.split(",")
			background(numbers[0].to_i, numbers[1].to_i, numbers[2].to_i)
		end
	end

	def mouse_pressed
		warn "The mouse was pressed"
		fill(rand(@i), rand(@i), rand(@i))
		rect(60, 60, 58, rand.to_i)
		ellipse(21, 21, 21, 21)

		stroke(255, 255, 255)
		if @i.nil? || @i == 225
			@i = 0
		end
			@i = @i + 6
			fill(@i, 5*@i, 52)
		
		@i.times do |j|
			fill(rand(@i), rand(@i), rand(@i))
			rect(200, @i, 20, 200)
			oval(@i, 400, @i, 200)
			triangle(@i, 40, 200, @i, 30, 300)
	end
	
		@i.times do |j|
			fill(rand(@i), rand(@i), rand(@i))
			oval(@i, 400, @i, @i)
			triangle(@i, 40, 200, @i, 30, 300)
	end
	end


	def mouse_dragged
		warn "Mouse is being dragged!!"
	end

	def mouse_released
		warn "Mouse was released!!"
	end
	
end

FirstSketch.new(:width => 400, :height => 400)
  