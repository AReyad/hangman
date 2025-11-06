# frozen_string_literal: true

class Display
  class << self
    def hide_word(word)
      '_' * word.length
    end

    def reveal_match(word, input)
      @displayed_word ||= hide_word(word)
      return unless word.include?(input)

      word.each_char.with_index do |char, index|
        displayed_word[index] = char if word[index] == input
      end
      displayed_word
    end

    def starter
      puts 'Welcome to Hangman'
      puts '- Your goal is to break the word by guessing a letter at a time.'
      puts '- Your lives decrement only when you guess a wrong letter.'
      puts "- You have 6 lives so be careful not to waste them.\n\n"
      puts 'NOTE! You can save the game by typing "save" instead of guessing.'
    end

    attr_accessor :displayed_word
  end
end
