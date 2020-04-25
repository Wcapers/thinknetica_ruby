=begin
Имеет название, которое указывается при ее создании OK
Может принимать поезда (по одному за раз) ОК
Может возвращать список всех поездов на станции, находящиеся в текущий момент ОК
Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских ОК
Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции). ОК
=end
require './instance_counter'

class Station
  attr_accessor :trains
  attr_reader :name
  @@all_stations = []
  include InstanceCounter

  def initialize (name)
    @name = name
    validate!
    @trains = Array.new
    @@all_stations << self
    register_instance
  end

  def self.all
    @@all_stations
  end

  def arrived (train) # добавляем поезд
    @trains << train
  end

  def left (train) # Убираем поезд
    @trains.delete(train)
  end

  def list_trains
    if @trains.any?
      @trains
    else
      raise "Поездов нет"
    end
  end

  def list_type(type) # Список поездов по типу
    if @trains.any?
      arr = @trains.select { |i| i.type == type }
    else
      raise "Поездов типа #{type} нет"
    end
  end

  def valide?
    validate!
    true
  rescue
    false
  end

  private

  def validate!
    raise "Слишком короткое название" if @name.size < 3
  end
end
