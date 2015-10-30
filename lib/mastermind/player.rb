module Mastermind
	class Player
		attr_reader :name, :type
		def initialize(input)
			@name = input.fetch(:name)
			@type = input.fetch(:type)
		end
	end
end