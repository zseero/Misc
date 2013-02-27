def lotsOfNums
	while true
		puts Random.rand(0..(10000 ** 15))
	end
end

def binary
	while true
		printf(Random.rand(0..1).to_s)
	end
end

class Stream
	def initialize count, width
		@width = width
		@sprites = []
		count.times do @sprites << Random.rand(0..@width) end
	end

	def update
		@sprites.map! do |sprite|
			sprite += Random.rand((-1)..(1))
			sprite = @width if sprite < 0
			sprite = 0 if sprite > @width
			sprite
		end
	end

	def draw
		s = ''
		@width.times do |i|
			if @sprites.include?(i)
				s += '1'
			else
				s += '0'
			end
		end
		puts s
	end
end

def stream
	printf "Stream Count: "
	hack = Stream.new(gets.chomp.to_i, 60)
	while true
		hack.update
		hack.draw
		sleep 0.02
	end
end

class Part
	attr_accessor :time
	def initialize(time)
		@time = time
	end

	def update
		@time -= 1 if @time > 0
	end

	def to_s
		if @time > 0
			'1'
		else
			'0'
		end
	end
end

def matrix
	nums = []
	printf "Width: "
	width = gets.chomp.to_i - 1
	width.times do
		nums << Part.new(0)
	end
	while true
		nums.map! do |num|
			num.update
			num
		end
		5.times do
			index = Random.rand(0...width)
			rI = index + 1
			rI = 0 if rI >= width
			lI = index - 1
			lI = 0 if lI >= width
			if nums[rI].time == 0 && nums[lI].time == 0
				nums[index].time = Random.rand(0..20)
			end
		end
		puts nums.join('')
		sleep 0.02
	end
end

matrix