# frozen_string_literal: true

require './players'

class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def get_points
    hand_points = 0
    @cards.each do |card|
      case card.nominal.to_i
      when 2..10
        hand_points += card.nominal.to_i
      when 0
        hand_points += if card.nominal == 'A'
                         if hand_points + 11 >= 21
                           1
                         else
                           11
                         end
                       else
                         10
                       end
      else
        return card
      end
    end
    hand_points
  end
end
