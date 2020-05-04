# frozen_string_literal: true
require './station'
require './modules/instance_counter'
require './modules/valid'
# Route
class Route
  include InstanceCounter
  include Validation
  attr_reader :point

  def initialize(first_station, last_station)
    @point = [first_station, last_station]
    self.class.validate :point[0], :type, Station
    self.class.validate :point[1], :type, Station
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
end
