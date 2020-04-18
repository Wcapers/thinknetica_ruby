class Train
  attr_accessor :speed, :carriage, :route, :curent
  attr_reader :number, :type

  def initialize (number, type, carriage)
    @number = number
    @type = type
    @carriage = carriage
    @speed = 0
  end

  def add_speed (speed) #Прибавляем скорость
    puts "К текущей скорости#{@speed} добавлено #{speed}"
    @speed += speed.to_i
  end

  def stop
    @speed = 0
    puts "Поезд остановился"
  end

  def add_cariage #добавляем вагон
    if @speed == 0
      @carriage += 1
      puts "Вагон прицеплен, текущее кол-во вагонов: #{@carriage}"
    else
      puts "Прицепка невозможна, остановите поезд"
    end
  end

  def rem_cariage #удаляем вагон
    if @speed = 0 && @carriage >= 1
      @carriage -= 1
      puts "Вагон отцеплен, текущее кол-во вагонов: #{@carriage}"
    else
      puts "Отцепка невозможна"
    end
  end
  def set_route(obj_route)
    @route = obj_route
    @curent = obj_route.route.first
    @route.route[0].arrived(self)
  end

  def move_forward
    next_id = @route.route.index(@curent) + 1
    if @route.route[next_id] != nil
      @curent = @route.route[next_id]
      @route.route[next_id].arrived(self)
    else
      puts "Движение невозможно"
    end

  def move_back
    prev_id = @route.route.index(@curent) - 1
    if prev_id > 0
      @curent = @route.route[prev_id]
      @route.route[prev_id].arrived(self)
    else
      puts "Движение невозможно"
    end
  end
end
