def square(a, h)
  0.5 * a * h
end
puts "Введите основание (a)"
a = gets.chomp.to_f
puts "Введите высоту (h)"
h = gets.chomp.to_f
puts "Площадь треугольника:#{square(a,h)}"
