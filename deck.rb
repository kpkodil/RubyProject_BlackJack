require './card.rb'

class Deck

attr_accessor :deck

	def initialize
		@deck = []
	  Card.const_get('SUITS').each do |suit|
      Card.const_get('NOMINALS').each do |nominal|
        @deck << Card.new(nominal, suit)
      end
    end
	end

end