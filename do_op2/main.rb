require './train'
require './station'
require './route'
require './pass_train'
require './cargo_train'
require './pass_carriage'
require './cargo_carriage'
=begin
# Станиция имеет название, которое указывается при ее создании
first_station = Station.new("Начальная")
last_station = Station.new("Последняя")
# Станция может принимать поезда (по одному за раз)
first_station_train = Train.new("777", "грузовой", 3)
train2 = Train.new("666", "пассажирский", 5)
first_station.arrived(first_station_train)
first_station.arrived(train2)
# Может возвращать список всех поездов на станции, находящиеся в текущий момент
puts "Поезда на станции #{first_station.list_trains}"
# Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
puts "Грузовые поезда на станции: #{first_station.list_type("грузовой")}"
puts "Пассажирские поезда на станции: #{first_station.list_type("пассажирский")}"
# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
first_station.left(first_station_train)
puts "Поезда на станции после отправления поезда: #{first_station.list_trains}"
# Маршрут имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании
# маршрута, а промежуточные могут добавляться между ними.
my_point = Route.new(first_station, last_station)
# Может добавлять промежуточную станцию в список
my_point.add_station(Station.new("Промежуточная-1"))
tmp_station = Station.new("Промежуточная-2")
my_point.add_station(tmp_station)
# Может выводить список всех станций по-порядку от начальной до конечной
my_point.del_station(tmp_station)
puts "Станции на маршруте: #{my_point.point}"
# Поезд имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании
# экземпляра класса
train1 = Train.new("340", "грузовой", 5)
train2 = Train.new("970", "пассажирский", 1)
# Может набирать скорость
train1.add_speed 10
train1.stop
puts "Количество вагонов первого поезда: #{train1.carriage}"
train1.speed = 10
train1.add_carriage
train1.rem_carriage
train1.stop
train1.add_carriage
# Может принимать маршрут следования (объект класса Route).
train1.set_point(my_point)
train2.set_point(my_point)
train1.move_forward
train1.move_forward
train1.move_forward
train1.move_forward
train1.move_back
puts train1.get_route_list
=end
