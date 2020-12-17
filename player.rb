require './programdata.rb'

class Players

	attr_accessor :name, :hand, :money

	def initialize(name)
		@name = name
		@hand = []
		@money = 100
	end

	def get_points
		hand_points = 0
		@hand.each do |card| 
			case card.nominal.to_i
			when 2..10
				hand_points += card.nominal.to_i
			when 0
				if card.nominal == 'A'
					if hand_points + 11 >= 21
						hand_points += 1
					else
						hand_points += 11
					end
				else
					hand_points += 10
				end
			else 
				return card
			end
		end
		hand_points
	end

	def skip_turn
		
	end

	def show_hand
		self.hand
	end

	def get_card
		Cards.deal_the_card(self)
	end
end

class Dealer < Players
	
	def choose
		case 
		when get_points >= 17
			skip_turn
		when get_points < 17
			get_card	
		end
	end
end
