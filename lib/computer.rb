class Computer
  attr_reader :word

  def initialize
    @word = generate_random_word
  end

  def filter_dictionary
    dictionary = File.open('dictionary.txt', 'r')

    filtered_dictionary = dictionary.select do |word|
      word if word.chomp.length.between?(5, 10)
    end
    dictionary.close
    filtered_dictionary
  end

  def generate_random_word
    random = rand(filter_dictionary.length)
    filter_dictionary[random]
  end
end
