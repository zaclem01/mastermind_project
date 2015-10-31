module Mastermind
	class Guesser < Player

		attr_reader :best_guess, :correct_colors, :incorrect_colors
		def initialize(input)
			super(input)
			@best_guess = []
			@correct_colors = {0 => '', 1 => '', 2 => '', 3 => ''}
			@incorrect_colors = {0 => [], 1 => [], 2 => [], 3 => []}
		end

		def generate_guess(colors, hint)
			puts "best guess is #{@best_guess}"
			puts correct_colors
			puts incorrect_colors
			new_guess = []
			if best_guess.empty?
				new_guess = colors.sample(4)
				@best_guess = new_guess
				return new_guess
			end
			best_guess.each_with_index do |color, index|
				if hint[index] == 'R'
					correct_colors[index] = color
				else
					incorrect_colors[index] << color 
				end
			end
			best_guess.each_with_index do |color, index|
				unless correct_colors[index].empty?
					new_guess[index] = correct_colors[index]
				else
					possible_colors = colors - incorrect_colors[index]
					new_guess[index] = possible_colors.sample
				end
			end
			@best_guess = new_guess
			return new_guess
		end

	end
end