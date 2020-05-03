# frozen_string_literal: true

require './modules/manufacturer'
require './modules/instance_counter'
require './modules/valid'
# Train
class Train
  include Manufacturer
  include InstanceCounter
  include Valid
  attr_accessor :speed, :carriages, :point, :curent
  attr_reader :number, :type
  NUMBER_FORMAT = /^[а-яa-z0-9]{3}-?[а-яa-z0-9]{2}$/i.freeze
  @@all_trains = []
  def initialize(number)
    @number = number.to_s
    validate!
    @carriages = []
    @speed = 0
    @@all_trains[number] = self
    register_instance
  end

  def each_carriage
    @carriages.each_with_index { |i, c| yield i, c }
  end

  def self.find(number)
    @@all_trains[number]
  end

  def add_speed(speed)
    @speed += speed.to_i
  end

  def stop
    @speed = 0
  end

  def add_carriage(carriage)
    @carriages << carriage if @speed.zero?
    raise 'Прицепка невозможна, остановите поезд' unless @speed.zero?
  end

  def rem_carriage
    @carriages.slice!(-1) if @speed.zero? && @carriages.size > 1
    raise 'Отцепка невозможна' unless @speed.zero? && @carriages.size > 1
  end

  def assign_point(route)
    @point = route
    @curent = route.point.first
    @point.point[0].arrived(self)
  end

  def next_staion_move(next_id)
    @point.point[next_id - 1].left(self)
    @curent = @point.point[next_id]
    @point.point[next_id].arrived(self)
  end

  def move_forward
    next_id = @point.point.index(@curent) + 1
    next_staion_move(next_id) if @point.point[next_id]
    raise 'Движение невозможно' unless @point.point[next_id]
  end

  def move_back
    prev_id = @point.point.index(@curent) - 1
    if prev_id.positive?
      @curent = @point.point[prev_id]
      @point.point[prev_id].arrived(self)
    end
    raise 'Движение невозможно' unless prev_id.positive?
  end

  def route_list
    id = @point.point.index(@curent)
    [@point.point[id - 1].name, @point.point[id].name,
     @point.point[id + 1].name]
  end

  private

  def validate!
    raise 'Неправильный формат номера' if NUMBER_FORMAT !~ @number
    raise 'Неправильная длина номера' if @number.size < 4 || @number.size > 7
  end
end
