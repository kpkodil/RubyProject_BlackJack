
class Card

  NOMINALS = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  SUITS = ["\u2665".encode('utf-8').to_s, "\u2666".encode('utf-8').to_s, "\u2663".encode('utf-8').to_s, "\u2660".encode('utf-8').to_s]

  attr_reader :nominal, :suit, :name

  def initialize(nominal, suit)
    @nominal = nominal
    @suit = suit
    @name = "#{self.nominal}#{self.suit} "
  end
end
