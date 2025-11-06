# frozen_string_literal: true

class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess
    user_input = gets.chomp
    if valid_guess?(user_input)
      user_input.downcase
    else
      puts 'Invalid guess, your guess should consist of one letter of the English Alphabet, or "save" to save the game.'
    end
  end

  def valid_guess?(input)
    input == 'save' || input.match?(/\A[a-zA-Z'-]*\z/) && input.length == 1
  end
end
