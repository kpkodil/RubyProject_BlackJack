class Cards

@@deck = []
@@nominals = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A' ]
@@suits = ["#{"\u2665".encode('utf-8')}", "#{"\u2666".encode('utf-8')}", "#{"\u2663".encode('utf-8')}", "#{"\u2660".encode('utf-8')}" ]
	def self.initialize_deck
		@@suits.each do |suit|
			@@nominals.each do |nominal|
				@@deck << Cards.new(nominal, suit)
			end
		end
		return @@deck
	end

	def self.deal_the_card
		card = @@deck.sample
		puts card.nominal + card.suit
		card_index = @@deck.index(card)
		@@deck.delete_at(card_index)
		return card
	end

attr_reader :nominal, :suit

	def initialize(nominal, suit)
		@nominal = nominal
		@suit = suit	
	end

	def self.get_card_points(card)
		case card.nominal.to_i
		when 2..10
			return card.nominal.to_i
		when 0
			if card.nominal == 'A'
				
			else
				return 10
			end
		end
	end
end 