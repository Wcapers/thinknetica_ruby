puts "Введите a"
a = gets.chomp.to_i
puts "Введите b"
b = gets.chomp.to_i
puts "Введите c"
c = gets.chomp.to_i
d = b**2 - 4 * a * c
d_sqr = Math.sqrt(d)
if d < 0
  puts  "Корней нет, D = #{d}"
elsif d > 0
  x1 = (-b + d_sqr)/(2*a)
  x2 = (-b - d_sqr)/(2*a)
  puts  "D = #{d}, x1 = #{x1}, x2 = #{x2}"
else
  x1 = (-b + 0)/(2*a)
  puts  "D = #{d}, x1 = #{x1}"
end
