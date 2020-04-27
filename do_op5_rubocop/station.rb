# frozen_string_literal: true

require './instance_counter'
require './valid'
class Station
  attr_accessor :trains
  attr_reader :name
  @@all_stations = []
  include InstanceCounter
  include Valid

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@all_stations << self
    register_instance
  end

  def each_train
    @trains.each { |t| yield t }
  end

  def self.all
    @@all_stations
  end

  def arrived(train) # добавляем поезд
    @trains << train
  end

  def left(train) # Убираем поезд
    @trains.delete(train)
  end

  def list_trains
    if @trains.any?
      @trains
    else
      raise 'Поездов нет'
    end
  end

  def list_type(type) # Список поездов по типу
    if @trains.any?
      arr = @trains.select { |i| i.type == type }
    else
      raise "Поездов типа #{type} нет"
    end
  end

  private

  def validate!
    raise 'Слишком короткое название' if @name.size < 3
  end
end
