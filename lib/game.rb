require_relative 'player'
require_relative 'computer'
require_relative 'display'

class Game
  def initialize
    @player = Player.new(gets.chomp)
    @computer = Computer.new
    @lives = 6
  end

  def play
    until game_over?
      puts computer.word
      print 'Enter your guess: '
      player_guess = player.guess
      next unless player_guess

      self.lives -= 1 if incorrect_guess?(player_guess)
      Display.reveal_match(computer.word, player_guess)
      puts "Lives left: #{lives}"
      puts Display.displayed_word
    end
  end

  def incorrect_guess?(input)
    !computer.word.include?(input)
  end

  def game_over?
    if lives.zero?
      puts "You died, word was: #{computer.word}."
      true
    elsif Display.displayed_word == computer.word
      puts "Congratulations! you got the word: #{computer.word}"
      true
    end
  end

  private

  attr_accessor :lives
  attr_reader :player, :computer
end

Game.new.play
