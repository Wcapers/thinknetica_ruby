orders = Hash.new
sum = 0
loop do
  puts "Введите название товара"
  name = gets.chomp
  break if name.downcase == "стоп"
  puts "Введите цену за единицу товара"
  price = gets.chomp.to_i
  puts "Введите кол-во купленного товара"
  amt = gets.chomp.to_f
  orders[name] = { price: price, amount: amt, total_price: price * amt }
end
exit unless orders.any?
puts orders
orders.each_value do |v|
  sum += v[:total_price]
end
puts "Итоговая цена:" + sum.to_s
