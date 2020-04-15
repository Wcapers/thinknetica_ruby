def leap_year(year)
  (year % 4 == 0) && !(year % 100 == 0) || (year % 400 == 0)
end
mounths = {January: 31, February: 28, March: 31, April: 30, May: 31, June: 30, July: 31, August: 31, September: 30, October: 31, November: 30, December: 31} #Help! Как засунуть это в цикл?
puts "Введите число, месяц и год через точку (dd.mm.yyyy)"
d, m, y = gets.chomp.split(".")
mounths[:February] = 29 if leap_year(y.to_i)
puts mounths.values.first(m.to_i - 1).sum + d.to_i
