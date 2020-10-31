class Gram

  attr_accessor :name, :file

  def initialize(name, file)
    @name = name
    @file = file
  end

  def welcome
    puts "Vous allez modifier #{@name}"
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




