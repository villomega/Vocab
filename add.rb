puts "Quel fichier voulez vous éditer?"
puts "0- En créer un nouveau"

classes = []
classe = Dir['SRC/*']
classe.each do |i|
	classes << i.split("/")[1]
end

for i in 1..classes.size
	puts "#{i}- #{classes[i-1]}"
end

c = gets.to_i - 1

if c == -1
  puts "Nom du fichier:"
  name = gets.chomp.to_s + ".csv"
  puts "Langue (autre que français):"
  language = gets.chomp
  puts "SRC/"+name
  file = File.open("SRC/"+name, "a+")
  file.write "Francais;" + language
end


