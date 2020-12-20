# frozen_string_literal: true

require './programdata'
require './interface'
require './players'
require './hand'
require './card'
require './deck'

class Logic
  BET = 10

  attr_accessor :data

  def initialize(data)
    @data = data
  end

  def initialize_players
    @data.players << Dealer.new('Dealer')
    Interface.menu
    name = gets.chomp
    @data.players << Players.new(name)
    start_game
  end

  def start_game
    @data.bank = 20
    @data.deck = Deck.new.instance_variable_get(:@deck)
    reset_players_hands
    bet
    deal_the_cards(2)
    Interface.show_player_cards(@data.players[1])
    show_players_money
    player_turn
  end

  def player_turn
    Interface.player_turn
    choice = gets.chomp
    case choice
    when '1'
      dealer_turn
    when '2'
      @data.players[1].get_card(@data.deck)
      Interface.show_player_cards(@data.players[1])
      dealer_turn
    when '3'
      who_win
    else
      Interface.quit_game
    end
    who_win
  end

  def dealer_turn
    @data.players[0].choose(@data.deck)
    who_win
  end

  def who_win
    puts ''
    show_players_cards
    dealer = @data.players[0]
    dealer_points = dealer.hand.get_points
    player = @data.players[1]
    player_points = player.hand.get_points

    if players_with_more_than_21.length == 2 || player_points == dealer_points
      Interface.drow
    elsif players_with_more_than_21.include?(dealer) || (player_points > dealer_points && players_with_more_than_21.empty?)
      player.money += @data.bank
      Interface.player_win
    elsif players_with_more_than_21.include?(player) || (player_points < dealer_points && players_with_more_than_21.empty?)
      dealer.money += @data.bank
      Interface.dealer_win
    end
    play_again?
  end

  def play_again?
    Interface.play_again?
    choice = gets.chomp
    case choice
    when '1'
      start_game
    else
      Interface.quit_game
    end
  end

  def players_with_more_than_21
    players_21 = []
    @data.players.each do |player|
      players_21 << player if player.hand.get_points > 21
    end
    players_21
  end

  def reset_players_hands
    @data.players.map do |player|
      player.hand.cards = []
    end
  end

  def bet
    @data.players.each do |player|
      if player.money >= BET
        player.money -= BET
      else
        Interface.out_of_money(player)
      end
    end
  end

  def deal_the_cards(quantity)
    @data.players.each do |player|
      (1..quantity).each do
        player.get_card(@data.deck)
      end
    end
  end

  def show_players_money
    @data.players.map do |player|
      Interface.show_player_money(player)
    end
  end

  def show_players_cards
    @data.players.each do |player|
      Interface.show_player_cards(player)
    end
  end

  def self.seed
    logic = Logic.new(ProgramData.new).initialize_players
  end
end
