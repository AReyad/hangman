# frozen_string_literal: true

require_relative 'player'
require_relative 'computer'
require_relative 'display'
require_relative 'basic_serialize'

class Game
  include BasicSerializable
  def initialize
    @word = Computer.new.word
    @lives = 6
  end

  def run
    Display.starter
    puts ''
    game_load if File.exist?('./saves/save.yaml')
    puts "Word: #{Display.hide_word(word)}" unless @displayed
    play
    end_message
  end

  def play
    player = Player.new('s')
    until game_over?
      print 'Enter your guess: '
      player_guess = player.guess
      next unless player_guess

      self.lives -= 1 if incorrect_guess?(player_guess)
      Display.reveal_match(word, player_guess)
      display_round
      confirm_save_exit
    end
  end

  def display_round
    puts "Lives left: #{lives}"
    puts "Word: #{Display.displayed_word}"
    self.displayed = Display.displayed_word
  end

  def incorrect_guess?(input)
    !word.include?(input)
  end

  def game_over?
    lives.zero? || Display.displayed_word == word
  end

  def end_message
    end_message = "Congratulations! you got the word: #{word}" if Display.displayed_word == word
    end_message = "You died, word was: #{word}." if lives.zero?
    puts end_message
  end

  def save
    Dir.mkdir('saves') unless Dir.exist?('./saves')
    File.new('./saves/save.yaml', 'w+') unless File.exist?('./saves/save.yaml')
    File.write('./saves/save.yaml', serialize, mode: 'w')
    puts 'Saved'
  end

  def confirm_save_exit
    return if game_over?

    puts 'Do you want to save and exit? Yes/No'
    user_input = gets.chomp.downcase
    return unless user_input == 'yes'

    save
    exit
  end

  def game_load
    puts 'Do you want to load your last saved game? Y/N'
    user_input = gets.chomp.downcase
    return unless user_input == 'y'

    unserialize(File.read('./saves/save.yaml'))
    Display.displayed_word = displayed
    display_round
  end

  protected

  attr_accessor :lives, :displayed, :word
end
