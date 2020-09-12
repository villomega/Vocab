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
    answer == @file[n][1] 
  end

end


round = 0.0
r = 0.0


linkwords = Gramclass.new "les Linking words", 'SRC/link_words.csv'
linkwords.welcome

while 1 != 0
  result = linkwords.randomWord
  round += 1
  puts round
  if result == true
    r += 1
    puts r
    puts "#{((r/round)*100).to_i}% de bonnes réponses"
  end


end

