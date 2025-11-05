# frozen_string_literal: true

class Display
  class << self
    def hide_word(word)
      string = ''
      word.length.times do
        string += '_'
      end
      string
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
      puts 'Your goal is to break the word by guessing a letter at a time.'
      puts 'Your lives decrements only when you guess a wrong letter.'
      puts 'You have 6 lives so be careful not to waste them.'
    end

    attr_accessor :displayed_word
  end
end
