require 'csv'

puts "Victor est le rois du monde"
puts "paypal.me/calipoou"

class Gramclass

  attr_accessor :rfile, :name, :ranswer

  def initialize(name, file)
    @name = name
    @file = CSV.read(file.to_s, col_sep: ';')
    @title = @file.shift
    @rfile = @file
    @size = @rfile.size
    @ranswer = ''
  end

  def welcome
    puts "Vous allez étudier #{@name}"
  end

  def randomWord
    n = rand(0...@size)
    choice = @rfile[n][0]
    @ranswer = @rfile[n][1]
    puts choice
    answer = gets.chomp
    rof = (@rfile[n][1].split('/')).include? answer
    if rof == false
      @rfile << @rfile[n]
      @size = @rfile.size
    end
    rof
  end

end


round = 0.0
r = 0.0

linkwords = Gramclass.new 'les Linking words', 'SRC/link_words.csv'
linkwords.welcome

while 1 != 0
  result = linkwords.randomWord
  round += 1
  if result == true
    r += 1
    puts 'Bonne réponse'
    puts "#{((r / round) * 100).to_i}% de bonnes réponses"
  else
    puts "Mauvaise réponse, c'étais #{linkwords.ranswer}"
  end
  puts ''

end

