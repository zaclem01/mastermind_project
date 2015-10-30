module Mastermind
	class Guesser < Player
		def generate_guess(colors)
			code = []
			4.times { code << colors.sample }
			code
		end
	end
end