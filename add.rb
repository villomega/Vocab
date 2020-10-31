require 'csv'
system('clear')

class Gram

  attr_accessor :name, :file, :language

  def initialize(name, file)
    @name = name
    @file = file
    @content = CSV.read(file.to_s, col_sep: ';')
    @language = @content[0][1]
  end

  def welcome
    puts "Vous allez modifier #{@name}"
  end

  def check french
    n = 0
    for i in 0...@content.size
      if @content[i][0].to_s.include?(french)
        puts "oui"
        n += 1
      end
    end
    if n > 0
      return true
    else
      return false
    end
  end

  def newword french, other
    if check(french) == true
      puts "Contenu"
    else
      puts "Non!"
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
  f.write "Francais;" + language
else
  file = classes[c]
end

gramclass = Gram.new "#{file.split(".")[0]}", "SRC/" + file
gramclass.welcome

while 1 != 0
  puts "Francais"
  fr = gets.chomp
  puts gramclass.language
  other = gets.chomp
  gramclass.newword fr, other
end



