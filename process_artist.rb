require 'ruby-processing'

class ProcessArtist < Processing::App

	def setup
		background(255, 255, 255)
		@number = "255,0,255"
		@size = 10 
		@i = 255
		@shape = "s1"
	end

	def draw 
		ellipse_mode CENTER
		rect_mode CENTER
	end

	def key_pressed 
		warn "A key was pressed! #{key.inspect}"
		if @queue.nil?
			@queue = ""
		end

		if key != "\n"
			@queue = @queue + key
		else
			warn "Time to run the command: #{@queue}"
			@shape = @queue.chomp
			@queue =""
		end

		if key == "+"
			@size += 100
		elsif key == "-"
			@size -= 100
		end
	end
	
	def change_shape(key)
		if key == "s1"
			ellipse(mouse_x, mouse_y, @size, @size)
		elsif key == "s2"
			oval(mouse_x, mouse_y, @size * 2, @size)
		elsif key == "s3"
			oval(mouse_x, mouse_y, @size, @size * 2)
		elsif key == "s4"
			rect(mouse_x, mouse_y, @size, @size)
		elsif key == "s5"
			rect(mouse_x, mouse_y, @size * 4, @size)
		elsif key == "s6"
			rect(mouse_x, mouse_y, @size, @size * 4)
		elsif key == "c"
			numbers = @number.split(",")
			background(numbers[0].to_i, numbers[1].to_i, numbers[2].to_i)
		end
		
		if key.start_with?("b")
			puts "we got a b"
			@number = key[1..key.length-1]
			numbers = @number.split(",")
			background(numbers[0].to_i, numbers[1].to_i, numbers[2].to_i)
		end
	end

	def mouse_pressed
		warn "The mouse was pressed"
		fill(rand(@i), rand(@i), rand(@i))
		change_shape(@shape)
	end

	def mouse_dragged
		warn "Mouse is being dragged!!"
		mouse_pressed
	end

	def mouse_released
		warn "Mouse was released!!"
	end
end

ProcessArtist.new(:width => 1000, :height => 800)

