# frozen_string_literal: true

require './logic'

class Interface
  def self.menu
    puts 'Добро пожаловать в игру Black Jack!'
    puts 'Введите Ваше имя'
  end

  def self.player_turn
    puts ''
    puts 'Нажмите 1, если хотите пропустить ход'
    puts 'Нажмите 2, если хотите взять карту'
    puts 'Нажмите 3, если хотите открыть карты'
    puts 'Нажмите любую другую клавишу для выхода'
  end

  def self.quit_game
    abort 'Вы вышли из игры'
  end

  def self.drow
    puts 'НИЧЬЯ, ДЕНЬГИ УХОДЯТ В КАЗИНО'
  end

  def self.player_win
    puts 'ВЫ ВЫЙГРАЛИ'
  end

  def self.dealer_win
    puts 'ВЫЙГРАЛ ДИЛЕР'
  end

  def self.out_of_money(player)
    abort "У игрока #{player.name} закончились деньги."
  end

  def self.play_again?
    puts 'Хотите сыграть еще раз? - Введите 1'
    puts 'Для выхода нажмите любую другую клавишу'
  end

  def self.show_player_money(player)
    puts "Деньги игрока #{player.name}: #{player.money}"
  end

  def self.show_player_cards(player)
    puts "Карты #{player.name}"
    player.hand.cards.each do |card|
      puts "#{card.nominal}#{card.suit} "
    end
    puts "Очки игрока #{player.name} : #{player.hand.get_points}"
  end
end
