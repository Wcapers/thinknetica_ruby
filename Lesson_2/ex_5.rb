def leap_year(year)
  (year % 4 == 0) && !(year % 100 == 0) || (year % 400 == 0)
end
months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
puts "Введите число, месяц и год через точку (dd.mm.yyyy)"
d, m, y = gets.chomp.split(".")
months[1] = 29 if leap_year(y.to_i)
puts months.first(m.to_i - 1).sum + d.to_i
