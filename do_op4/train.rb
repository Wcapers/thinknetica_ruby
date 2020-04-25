require './manufacturer'
require './instance_counter'

class Train
  include Manufacturer
  include InstanceCounter
  attr_accessor :speed, :carriage, :point, :curent
  attr_reader :number, :type
  NUMBER_FORMAT = /^[а-яa-z0-9]{3}-?[а-яa-z0-9]{2}$/i
  @@all_trains = {}

  def initialize (number)
    @number = number.to_s
    validate!
    type = nil
    @carriage = Array.new
    @speed = 0
    @@all_trains[number] = self
    register_instance
  end

  def self.find(number)
    @@all_trains[number]
  end

  def add_speed (speed) #Прибавляем скорость
    @speed += speed.to_i
  end

  def stop
    @speed = 0
  end

  def add_carriage (carriage)#добавляем вагон
    if @speed == 0
      @carriage << carriage
    else
      raise "Прицепка невозможна, остановите поезд"
    end
  end

  def rem_carriage #удаляем вагон
    if @speed == 0 && @carriage.size > 1
      @carriage.slice!(-1)
    else
      raise "Отцепка невозможна"
    end
  end

  def set_point(route) #назначение маршрута
    @point = route
    @curent = route.point.first
    @point.point[0].arrived(self)
  end

  def move_forward #Двигаемся вперед
    next_id = @point.point.index(@curent) + 1
    if @point.point[next_id]
      @point.point[next_id - 1].left(self)  #Удаление из текущей станции
      @curent = @point.point[next_id]
      @point.point[next_id].arrived(self)   #прибытие в текущую станцию
    else
      raise "Движение невозможно"
    end
  end

  def move_back
    prev_id = @point.point.index(@curent) - 1
    if prev_id > 0
      @curent = @point.point[prev_id]
      @point.point[prev_id].arrived(self)
    else
      raise "Движение невозможно"
    end
  end

  def get_route_list
    id = @point.point.index(@curent)
    [@point.point[id - 1].name, @point.point[id].name, @point.point[id + 1].name]
  end
  def valid?
    validate!
    true
  rescue
    false
  end

  private

  def validate!
    raise "Неправильный формат номера" if NUMBER_FORMAT !~ @number
    raise "Неправильная длина номера" if @number.size < 4  || @number.size > 7
  end
end
