module Mastermind
	class Game

		attr_reader :players, :codemaker, :guesser, :board, :colors, :code
		def initialize(players, board = Board.new, colors = [])
			@codemaker = players[0]
			@guesser = players[1]
			@board = board
			@colors = colors.empty? ? default_colors : colors
		end

		def get_code(player)
			if player.type == :human
				puts "#{player.name} please enter your secret code seperated
by commas using the following colors: "
				colors.each { |color| print "#{color} "}
				code = gets.chomp.upcase
				code = code.split(",")
			else
				code = player.generate_code(colors)
			end
			code
		end

		def get_guess(player, hint)
			if player.type == :human
				puts "#{player.name} please enter your guess seperated
by commas using the following colors: "
				colors.each { |color| print "#{color} "}
				guess = gets.chomp.upcase
				guess = guess.split(",")
			else
				guess = player.generate_guess(colors, hint)
			end
			guess
		end

		def intro_message
			puts "Welcome to Mastermind!

Instructions:

1. Choose your role. Codemaker gets to create a code.
   Guesser gets to guess that code. It's that simple!
2. If you're the Codemaker, enter a 4 colored peg
   code.
3. The Guesser will then try to guess the code created
   by the Codemaker.
4. A hint will be given based on the guess. Any colored
   peg in the correct position will be assigned a red
   hint peg. Any peg that is the correct color but in
   the wrong position will be assigned a white hint peg.
5. The Guesser repeats this process for a limited number
   of turns. If the code isn't guessed by then, the
   Codemaker wins."
		end

		def play
			turn = 0
			intro_message
			@code = get_code(codemaker)
			while true
				board.display_board
				previous_hint = board.get_hint_row(turn-1)
				guess = get_guess(guesser, previous_hint)
				board.set_guess_row(turn, guess)
				hint = board.generate_hint(guess, code)
				board.set_hint_row(turn, hint)
				if board.board_full?
					puts "The Codemaker, #{codemaker.name}, won!"
					puts "The correct code was #{code}"
					return
				elsif board.correct_guess?(guess, code)
					puts "#{guesser.name} won the game with the correct guess of #{code}"
					return
				end
				turn += 1
			end
		end

		private

		def default_colors
			['R', 'B', 'G', 'Y', 'O', 'P']
		end
	end
end