module Mastermind
	class Board
		RED_PEG = 'R'
		WHITE_PEG = 'W'
		BLANK_PEG = ' '

		attr_reader :guess_grid, :hint_grid
		def initialize(input = {})
			@guess_grid = input.fetch(:guess_grid, default_grid)
			@hint_grid = input.fetch(:hint_grid, default_grid)
		end

		def generate_hint(guess, code)
			hint = []
			guess.each_with_index do |peg, index|
				if code[index] == peg
					hint << RED_PEG
				elsif code.include?(peg)
					hint << WHITE_PEG
				else
					hint << BLANK_PEG
				end
			end
			hint
		end

		def board_full?
			guess_grid.all? do |element|
				element.none? { |peg| peg == " " }
			end
		end

		def correct_guess?(guess, code)
			guess == code
		end

		def display_board
			puts "\nGuess Grid"
			puts "-------------------"
			guess_grid.each_with_index do |row, index|
				puts "#{index} | #{row[0]} | #{row[1]} | #{row[2]} | #{row[3]} |"
				puts "-------------------"
			end
			puts "\nHint Grid"
			puts "-------------------"
			hint_grid.each_with_index do |row, index|
				puts "#{index} | #{row[0]} | #{row[1]} | #{row[2]} | #{row[3]} |"
				puts "-------------------"
			end
		end

		def set_guess_row(row, value)
			guess_grid[row] = value
		end

		def get_hint_row(row)
			hint_grid[row]
		end

		def set_hint_row(row, value)
			hint_grid[row] = value
		end

		private

		def default_grid
			Array.new(10) { Array.new(4) { " " } }
		end

	end
end