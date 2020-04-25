=begin Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними. ОК
Может добавлять промежуточную станцию в список ОК
Может удалять промежуточную станцию из списка OK
Может выводить список всех станций по-порядку от начальной до конечной OK
=end
require './instance_counter'
class Route
  attr_reader :point
  def initialize (first_station, last_station)
    @point = [first_station, last_station]
    validate!
    register_instance
  end

  def add_station (station)
    @point.insert(-2, station)
  end

  def del_station(station)
    @point.delete(station)
  end

  def puts_point
    puts @point
  end

  def valid?
    validate!
    true
  rescue
    false
  end
  private

  def validate!
    raise "Начальная и конечная станция не должны совпадать" if point.first == point.last
  end
end
