# frozen_string_literal: true

require './modules/instance_counter'
require './modules/valid'
# Station
class Station
  attr_accessor :trains
  attr_reader :name
  include InstanceCounter
  include Valid

  def initialize(name)
    @name = name
    validate!
    @@all_stations = []
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

  def arrived(train)
    @trains << train
  end

  def left(train)
    @trains.delete(train)
  end

  def list_trains
    @trains if @trains.any?
    raise 'Поездов нет' unless @trains.any?
  end

  def list_type(type)
    @trains.select { |i| i.type == type } if @trains.any?
    raise "Поездов типа #{type} нет" unless @trains.any?
  end

  private

  def validate!
    raise 'Слишком короткое название' if @name.size < 3
  end
end
