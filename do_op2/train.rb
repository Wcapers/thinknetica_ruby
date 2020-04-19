class Train
  attr_accessor :speed, :carriage, :point, :curent
  attr_reader :number, :type

  def initialize (number)
    @number = number
    type = nil
    @carriage = Array.new
    @speed = 0
  end

  def add_speed (speed) #Прибавляем скорость
    puts "К текущей скорости #{@speed} добавлено #{speed}"
    @speed += speed.to_i
  end

  def stop
    @speed = 0
    puts "Поезд остановился"
  end

  def add_carriage (carriage)#добавляем вагон
    if @speed == 0
      @carriage << cariage
      puts "Вагон прицеплен, текущее кол-во вагонов: #{@carriage.size}"
    else
      puts "Прицепка невозможна, остановите поезд"
    end
  end

  def rem_carriage #удаляем вагон
    if @speed == 0 && @carriage.size > 1
      @carriage.slise!(-1)
      puts "Вагон отцеплен, текущие количество вагонов: #{@carriage.size}"
    else
      puts "Отцепка невозможна"
    end
  end

  def set_point(route) #назначение маршрута
    @point = roue
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
      puts "Движение невозможно"
    end
  end

  def move_back
    prev_id = @point.point.index(@curent) - 1
    if prev_id > 0
      @curent = @point.point[prev_id]
      @point.point[prev_id].arrived(self)
    else
      puts "Движение невозможно"
    end
  end

  def get_route_list
    id = @point.point.index(@curent)
    [@point.point[id - 1].name, @point.point[id].name, @point.point[id + 1].name]
  end
end
