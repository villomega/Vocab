require 'csv'
system('clear')

class Gram

  attr_accessor :name, :file, :language

  def initialize(name, file)
    @name = name
    @file = file
    @content = CSV.read(file.to_s, col_sep: ';')
    @language = @content[0][1]
    @rang
  end

  def welcome
    puts "Vous allez modifier #{@name}"
  end

  def load_file
    @content = CSV.read(file.to_s, col_sep: ';')
  end

  def check french
    n = 0
    for i in 0...@content.size
      if @content[i][0].split(" ").include?(french)
        @rang = i
        n += 1
      end
    end
    if n > 0
      true
    else
      false
    end
  end

  def newword french, other
    if check(french)
      lines = File.readlines(@file)
      lines[@rang] = lines[@rang].chomp + "/" + other + "\n"
      File.open(@file, 'w') { |f| f.write(lines.join) }
    else
      File.open(@file, "a+") do |file|
        file.puts french + ";" + other + "\n"
      end
    end
  end
end

puts "Quel fichier voulez vous éditer?"
puts "0- En créer un nouveau"

classes = []
classe = Dir['SRC/*']
classe.each do |i|
	classes << i.split("/")[1]
end

(1..classes.size).each { |i|
  puts "#{i}- #{classes[i - 1].split(".")[0]}"
}

c = gets.to_i - 1

if c == -1
  puts "Nom du fichier:"
  file = gets.chomp.to_s + ".csv"
  puts "Langue (autre que français):"
  language = gets.chomp
  f = File.open("SRC/"+file, "a+")
  f.write "Francais;" + language + "\n"
  f.close
  puts "Le programme vient de s'arréter, veuillez le relancer pour voir les modifications."
  exit
else
  file = classes[c]
end

gramclass = Gram.new "#{file.split(".")[0]}", "SRC/" + file
gramclass.welcome

while 1 != 0
  gramclass.load_file
  puts "Francais"
  fr = gets.chomp
  puts gramclass.language
  other = gets.chomp
  gramclass.newword fr, other
end

