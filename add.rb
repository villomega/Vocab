classes = `ls SRC`.split ' '

puts 'Quel fichier voulez vous éditer?'


for i in 1..classes.size
  puts "#{i}- #{classes[i-1]}"
end

choice = gets.to_i - 1

while 1!=0
	puts 'Francais:'
	fr = gets.chomp
	puts 'Autre langue:'
	trad = gets.chomp
	puts "#{fr}:#{trad}"
end