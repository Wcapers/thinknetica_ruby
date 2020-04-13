def get_pifagor(a,b,c)

  if a > b && a > c
    hypotenuse = a
    sum_sqr = b**2 + c**2

  elsif b > a && b > c
    hypotenuse = b
    sum_sqr = a**2 + c**2
  else
    hypotenuse = c
    sum_sqr = b**2 + a**2
  end
hypotenuse**2 == sum_sqr
 end

puts "Введите 1-ю сторону"
a = gets.chomp.to_f
puts "Введите 2-ю сторону"
b = gets.chomp.to_f
puts "Введите 3-ю сторону"
c = gets.chomp.to_f
if a == b && b == c
  puts "Треугольник равнобедренный и равносторонний"
  exit
elsif a == b || b == c || a == c
  puts "Треугольник равнобедренный"
elsif get_pifagor(a, b, c)
  puts "Треугольник прямоугольный"
else
  puts "Треугольник не прямоугольный не равнобедренный и не равносторонний"
end
