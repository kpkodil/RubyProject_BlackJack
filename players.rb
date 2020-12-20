# frozen_string_literal: true

# require './hand'

class Players
  attr_accessor :name, :hand, :money

  START_MONEY = 100

  def initialize(name)
    @name = name
    @hand = Hand.new
    @money = START_MONEY
  end

  def skip_turn; end

  def get_card(deck)
    card = deck.sample
    card_index = deck.index(card)
    deck.delete_at(card_index)
    @hand.cards << card
  end
end

class Dealer < Players
  def choose(deck)
    if hand.get_points >= 17
      skip_turn
    elsif hand.get_points < 17
      get_card(deck)
    end
  end
end
