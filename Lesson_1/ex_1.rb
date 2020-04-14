puts "Ведите имя"
name = gets.chomp
puts "Введите рост"
height = gets.chomp.to_f
perfect_weight = (height - 110) * 1.15
if perfect_weight <= 0
  puts "Ваш вес уже идеальный"
else
  puts "#{name}, Ваш идеальный вес: #{perfect_weight}"
end
