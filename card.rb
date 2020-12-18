# frozen_string_literal: true

# require './player.rb'

class Card
  # @@deck = []
  # @@nominals = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  # @@suits = ["\u2665".encode('utf-8').to_s, "\u2666".encode('utf-8').to_s, "\u2663".encode('utf-8').to_s, "\u2660".encode('utf-8').to_s]


  # @@deck = []
  NOMINALS = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  SUITS = ["\u2665".encode('utf-8').to_s, "\u2666".encode('utf-8').to_s, "\u2663".encode('utf-8').to_s, "\u2660".encode('utf-8').to_s]

  # def self.initialize_cards

  #   SUITS.each do |suit|
  #     NOMINALS.each do |nominal|
  #       @@deck << Card.new(nominal, suit)
  #     end
  #   end
  #   @@deck
  # end

  # def self.deal_the_card(player)
  #   card = @@deck.sample
  #   # puts card.nominal + card.suit
  #   card_index = @@deck.index(card)
  #   @@deck.delete_at(card_index)
  #   player.hand << card
  # end

  attr_reader :nominal, :suit, :name

  def initialize(nominal, suit)
    @nominal = nominal
    @suit = suit
    @name = "#{self.nominal}#{self.suit} "
  end
end
