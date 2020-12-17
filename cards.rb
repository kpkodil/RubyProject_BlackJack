#require './player.rb'

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

	def self.deal_the_card(player)
		card = @@deck.sample
		#puts card.nominal + card.suit
		card_index = @@deck.index(card)
		@@deck.delete_at(card_index)
		player.hand << card
	end

attr_reader :nominal, :suit, :name

	def initialize(nominal, suit)
		@nominal = nominal
		@suit = suit
		@name = "#{self.nominal.to_s}#{self.suit.to_s} "
	end


end 