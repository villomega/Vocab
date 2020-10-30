require 'csv'
system('clear')

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

classes = []
classe = Dir['SRC/*']
classe.each do |i|
  classes << i.split("/")[1]
end



puts "Quelle classe voulez vous réviser?"


for i in 1..classes.size
  puts "#{i}- #{classes[i-1]}"
end

choice = gets.to_i - 1

puts "Test: #{classes[choice]}"


gram = Gramclass.new "#{classes[choice].split(".")[0]}", "SRC/#{classes[choice]}"
gram.welcome


while 1 != 0
  puts "#{(round.to_i + 1).to_s}]"
  result = gram.randomWord
  round += 1
  if result == true
    r += 1
    puts 'Bonne réponse'
    puts "Tu aurais pu mettre #{gram.ranswer}"
    puts "#{((r / round) * 100).to_i}% de bonnes réponses"
    #puts gram.rfile.to_s
  else
    puts "Mauvaise réponse, c'étais #{gram.ranswer}"
  end
  puts ''

end

