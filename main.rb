require 'csv'

class Gramclass

  attr_accessor :file, :name, :ranswer

  def initialize(name, file)
    @name = name
    @file = CSV.read(file.to_s, col_sep: ';')
    @title = @file.shift
    @size = @file.size
    @ranswer = ""
  end

  def welcome
    puts "Vous allez étudier #{@name}"
  end

  def randomWord
    n = rand(0..@size)
    choice = @file[n][0]
    @ranswer = @file[n][1]
    puts choice
    answer = gets.chomp
    (@file[n][1].split("/")).include? answer
  end

end


round = 0.0
r = 0.0


linkwords = Gramclass.new "les Linking words", 'SRC/link_words.csv'
linkwords.welcome

while 1 != 0
  result = linkwords.randomWord
  round += 1
  if result == true
    r += 1
    puts "Bonne réponse"
    puts "#{((r / round) * 100).to_i}% de bonnes réponses"
  else
    puts "Mauvaise réponse, c'étais #{linkwords.ranswer}"
  end
end

