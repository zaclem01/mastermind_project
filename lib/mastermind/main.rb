require_relative "../mastermind.rb"

play_again = true

while play_again
	players = []

	puts "Welcome to Mastermind!"
	puts "What's your name?"
	name = gets.chomp.upcase
	
	puts "Would you like to be the Codemaker or the Guesser?"
	choice = gets.chomp.downcase
	until choice == "codemaker" || choice == "guesser"
		puts "Would you like to be the Codemaker or the Guesser?"
		choice = gets.chomp.downcase
	end
	if choice == "codemaker"
		cm_input = {name: name, type: :human}
		g_input = {name: "CPU", type: :computer}
	elsif choice == "guesser"
		cm_input = {name: "CPU", type: :computer}
		g_input = {name: name, type: :human}
	end

	players << Mastermind::Codemaker.new(cm_input)
	players << Mastermind::Guesser.new(g_input)
	game = Mastermind::Game.new(players).play
	
	puts "Would you like to play Mastermind again (Y/N)?"
	decision = gets.chomp.upcase
	until decision == "Y" || decision == "N"
		puts "Please choose (Y/N)?"
		decision = gets.chomp.upcase
	end
	play_again = decision == "Y" ? true : false
end