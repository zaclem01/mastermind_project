module Mastermind
	class Game

		attr_reader :players, :board, :code, :colors
		def initialize(players, board = Board.new, code = [], colors = [])
			@players = players
			@board = board
			@colors = colors.empty? ? default_colors : colors
			@code = code.empty? ? create_code(@colors) : code
		end

		def get_guess(player)
			puts "#{player.name} please enter your guess seperated
by commas (in the following format): R,R,G,B"
			guess = gets.chomp.upcase
			guess = guess.split(",")
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
			while true
				board.display_board
				guess = get_guess(players[0])
				board.set_guess_row(turn, guess)
				hint = board.generate_hint(guess, code)
				board.set_hint_row(turn, hint)
				if board.board_full?
					puts "The Codemaker won..."
					puts "The correct code was #{code}"
					return
				elsif board.correct_guess?(guess, code)
					puts "#{players[0].name} won the game with the correct guess of #{code}"
					return
				end
				turn += 1
			end
		end

		private

		def create_code(colors)
			code = []
			4.times { code << colors.sample }
			code
		end

		def default_colors
			['R', 'B', 'G', 'Y', 'O', 'P']
		end
	end
end