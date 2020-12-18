# frozen_string_literal: true

require './programdata'
require './player'
require './cards'

class Interface
  def initialize(data)
    @data = data
  end

  def menu
    @data.players << Dealer.new('Dealer')
    puts 'Добро пожаловать в игру Black Jack!'
    puts 'Введите Ваше имя'
    name = gets.chomp
    @data.players << Players.new(name)
    start_game
  end

  def start_game
    puts ''
    @data.bank = 20
    @data.deck = Card.initialize_deck
    reset_players_hands
    bet
    deal_the_cards(2)
    show_player_cards(@data.players[1])
    show_players_money
    next_turn
  end

  def next_turn
    # unless @data.players.each {|player| player.hand.length == 3}
    puts ''
    puts 'Нажмите 1, если хотите пропустить ход'
    puts 'Нажмите 2, если хотите взять карту'
    puts 'Нажмите 3, если хотите открыть карты'
    puts 'Нажмите любую другую клавишу для выхода'
    choice = gets.chomp
    case choice
    when '1'
      dealer_turn
    when '2'
      @data.players[1].get_card
      show_player_cards(@data.players[1])
      dealer_turn
    when '3'
      who_win
    else
      abort 'Вы вышли из игры'
    end
    who_win
    # end
  end

  def who_win
    puts ''
    show_players_cards
    dealer = @data.players[0]
    player = @data.players[1]
    if players_with_more_than_21.length == 2 || player.get_points == dealer.get_points
      puts 'НИЧЬЯ, ДЕНЬГИ УХОДЯТ В КАЗИНО'
    elsif players_with_more_than_21.include?(dealer) || (player.get_points > dealer.get_points && players_with_more_than_21.empty?)
      player.money += @data.bank
      puts 'ВЫ ВЫЙГРАЛИ'
    elsif players_with_more_than_21.include?(player) || (player.get_points < dealer.get_points && players_with_more_than_21.empty?)
      dealer.money += @data.bank
      puts 'ВЫЙГРАЛ ДИЛЕР'
    end
    play_again?
  end

  def play_again?
    puts 'Хотите сыграть еще раз? - Введите 1'
    puts 'Для выхода нажмите любую другую клавишу'
    choice = gets.chomp
    case choice
    when '1'
      start_game
    else
      abort 'Вы закончили игру'
    end
  end

  def players_with_more_than_21
    players_21 = []
    @data.players.each do |player|
      players_21 << player if player.get_points > 21
    end
    players_21
  end

  def dealer_turn
    @data.players[0].choose
    #next_turn
    who_win
  end

  def reset_players_hands
    @data.players.map do |player|
      player.hand = []
    end
  end

  def deal_the_cards(quantity)
    @data.players.each do |player|
      (0..quantity - 1).each do
        player.get_card
      end
    end
  end

  def show_players_money
    @data.players.map do |player|
      puts "Деньги игрока #{player.name}: #{player.money}"
    end
  end

  def bet
    @data.players.each do |player|
      if player.money >= 10
        player.money -= 10
      else
        abort "У игрока #{player.name} закончились деньги."
      end
    end
  end

  def show_player_cards(player)
    puts "Карты #{player.name}"
    player.hand.each do |card|
      puts "#{card.name} "
    end
    puts "Очки игрока #{player.name} : #{player.get_points}"
  end

  def show_players_cards
    @data.players.each do |player|
      show_player_cards(player)
    end
  end

  def self.seed
    data = ProgramData.new
    interaface = Interface.new(data).menu
  end
end
