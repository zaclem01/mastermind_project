module Mastermind
	class Codemaker < Player
		def generate_code(colors)
			code = []
			4.times { code << colors.sample }
			code
		end
	end
end