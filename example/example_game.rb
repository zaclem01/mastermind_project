require_relative "../lib/mastermind.rb"

guesser = Mastermind::Player.new("Zac")
codemaker = Mastermind::Player.new("Bob")
players = [guesser, codemaker]

game = Mastermind::Game.new(players)
game.play