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

    attr_accessor :displayed_word
  end
end
