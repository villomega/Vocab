require 'csv'

class Gramclass

  attr_accessor :file, :name

  def initialize(name, file)
    @name = name
    @file = CSV.read(file.to_s, col_sep: ';')
    @title = @file.shift
    @size = @file.size
  end

  def welcome
    puts "Vous allez étudier #{@name}"
  end

  def randomWord
    n = rand(0..@size)
    choice = @file[n][0]
    puts choice
    answer = gets.chomp
    if answer == @file[n][1]
      puts "Bonne réponse"
    else
      puts "Mauvaise réponse, la bonne étais #{@file[n][1]}"
    end
  end

end

linkwords = Gramclass.new "les Linking words", 'SRC/link_words.csv'
linkwords.welcome

while 1 != 0
  linkwords.randomWord
end

