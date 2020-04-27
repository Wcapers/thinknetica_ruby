# frozen_string_literal: true

require './instance_counter'
require './valid'
class Route
  include InstanceCounter
  include Valid
  attr_reader :point
  def initialize(first_station, last_station)
    @point = [first_station, last_station]
    validate!
    register_instance
  end

  def add_station(station)
    @point.insert(-2, station)
  end

  def del_station(station)
    @point.delete(station)
  end

  def puts_point
    puts @point
  end

  private

  def validate!
    if point.first == point.last
      raise 'Начальная и конечная станция не должны совпадать'
    end
  end
end
