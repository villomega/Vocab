require 'csv'

class Gramclass

  def initialize(name, file)
    @name = name
    @file = CSV.read file.to_s, col_sep: ';'
    @size = @file.size
  end

  def welcome
    puts "Vous allez étudier #{@name}"
  end

  def randomWord
    
  end

end

linkwords = Gramclass.new "les Linking words", 'SRC/link_words.csv'
linkwords.welcome
linkwords.randomWord
