# frozen_string_literal: true

require './card'

class Deck
  attr_accessor :deck

  def initialize
    @deck = []
    Card::SUITS.each do |suit|
      Card::NOMINALS.each do |nominal|
        @deck << Card.new(nominal, suit)
      end
    end
  end
end
