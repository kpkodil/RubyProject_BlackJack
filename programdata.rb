# frozen_string_literal: true

class ProgramData
  attr_accessor :players, :deck, :bank

  def initialize(players = [], deck = [], bank = 0)
    @players = players
    @deck = deck
    @bank = bank
  end
end
