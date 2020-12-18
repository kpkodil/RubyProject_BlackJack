#Создан класс Deck

require './card.rb'
# require './player.rb'

class Deck

attr_accessor :deck

	#Метод создания колоды перенесен из класса Card

	def initialize
		@deck = []
	  Card.const_get('SUITS').each do |suit|
      Card.const_get('NOMINALS').each do |nominal|
        @deck << Card.new(nominal, suit)
      end
    end
	end

	#Метод перенесен из класса Card

  def deal_the_card(player)
    card = @deck.sample
    card_index = @deck.index(card)
    @deck.delete_at(card_index)
    player.hand << card
  end	

end