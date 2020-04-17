=begin
Имеет название, которое указывается при ее создании OK
Может принимать поезда (по одному за раз) ОК
Может возвращать список всех поездов на станции, находящиеся в текущий момент ОК
Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских ОК
Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции). ОК
=end
class Station
  attr_accessor :trains
  attr_reader :name

  def initialize (name)
    @name = name
    @trains = Array.new
  end

  def arrived (train) # добавляем поезд
    @trains << train
  end

  def left (train) # Убираем поезд
    @trains.delete(train)
  end

  def arr_type(type) # Список поездов по типу
    if @trains.any?
      arr = @trains.select { |i| i.type == type }
    else
      puts "Поездов типа #{type} нет"
  end
