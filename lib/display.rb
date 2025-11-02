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
      return unless word.include?(input)

      # Prevent displayed_word from resetting when the function is called
      @displayed_word = hide_word(word) unless @revealed
      @revealed = true

      word.each_char.with_index do |char, index|
        displayed_word[index] = char if word[index] == input
      end
      displayed_word
    end

    private

    attr_reader :displayed_word
  end
end
