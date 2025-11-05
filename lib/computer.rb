class Computer
  attr_reader :word

  MIN_WORD_LENGTH = 5
  MAX_WORD_LENGTH = 12

  def initialize
    @word = generate_random_word
  end

  def filter_dictionary
    dictionary = File.open('./dictionary.txt', 'r')

    filtered_dictionary = dictionary.select do |word|
      word if word.chomp.length.between?(MIN_WORD_LENGTH, MAX_WORD_LENGTH)
    end
    dictionary.close
    filtered_dictionary
  end

  def generate_random_word
    random = rand(filter_dictionary.length)
    filter_dictionary[random].chomp
  end
end
