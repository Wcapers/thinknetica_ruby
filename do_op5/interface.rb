require './train'
require './station'
require './route'
require './pass_train'
require './cargo_train'
require './carriage'
require './pass_carriage'
require './cargo_carriage'
class Interface
  attr_reader :stations, :trains, :routes, :carriages
  UNKNOWN = "Неизвестное значение"
  def initialize
    @stations = []
    @trains = []
    @routes = []
    @carriages = []
  end

    def start
    loop do
    puts "Введите 1 для создания станции"
    puts "Введите 2 для создания поезда"
    puts "Введите 3 для создания и редактирования маршрута"
    puts "Введите 4 для назначения маршрута поезду"
    puts "Введите 5 для операций с вагонами"
    puts "Введите 6 для перемещения поезда вперед или назад по маршруту"
    puts "Введите 7 для вывода списков"
    puts "Введите 0 для выхода"
    input = gets.chomp.to_i
    case input
      when 1 then create_station
      when 2 then create_train
      when 3 then route_menu
      when 4 then give_route
      when 5 then carriage_menu
      when 6 then move_menu
      when 7 then list_menu
      when 0 then break
      else
        raise UNKNOWN
      end
    end
  end


private

  attr_writer :stations, :trains, :routes
  def route_menu
    loop do
      puts "Введите 1 - для создания маршрута, 2 - для добавления станции в маршрут, 3 - для удаления станции из маршрута, 0 - веруться в главное меню"
      selected = gets.chomp.to_i
      case selected
      when 1 then create_route
      when 2 then add_in_route
      when 3 then del_in_route
      when 0 then break
      else
        puts UNKNOWN
      end
    end
  end

  def carriage_menu
    loop do
      puts "Введите 1 - для прицепки вагона, 2 - для отцепки вагона, 3 - для создания вагона, 4 - для заполнения вагона, 0 - веруться назад"
      selected = gets.chomp.to_i
      case selected
      when 1 then hitch_carriage
      when 2 then del_carriage
      when 3 then create_carriage
      when 4 then fill_carriage
      when 0 then break
      else
        puts UNKNOWN
      end
    end
  end

  def move_menu
    loop do
      puts "Введите 1 - для движения вперед, 2 - для движения назад, 0 - веруться в главное меню"
      selected = gets.chomp.to_i
      case selected
      when 1 then forward
      when 2 then back
      when 0 then break
      else
        puts UNKNOWN
      end
    end
  end
  def list_menu
    loop do
      puts "Введите 1 - для просмотра доступных станций, 2 - для просмотра поездов на станции, 3 - для вывода списка вагонов у поезда, 0 - веруться назад"
      selected = gets.chomp.to_i
      case selected
      when 1 then print_stations_list
      when 2 then print_trains_stations
      when 3 then print_train_carriages
      when 0 then break
      else
        puts UNKNOWN
      end
    end
  end
=begin
А для каждого поезда на станции выводить список вагонов в формате:
- Номер вагона (можно назначать автоматически), тип вагона, кол-во свободных и занятых мест (для пассажирского вагона) или кол-во свободного и занятого объема (для грузовых вагонов).
=end
  def create_station
    puts "Введите имя станции"
    name = gets.chomp
    @stations << Station.new(name)
  rescue RuntimeError => e
    puts e.message.to_s
    retry
  end

  def create_train
    loop do
      puts "Выберите тип поезда(1 - пассажирский, 2 - грузовой, 0 - веруться в главное меню)"
      selected = gets.to_i
      puts "Введите номер поезда"
      case selected
      when 1 then @trains << PassTrain.new(gets.to_i)
      when 2 then @trains << CargoTrain.new(gets.to_i)
      when 0 then break
      else
        puts UNKNOWN
      end
    rescue RuntimeError => e
      puts e.message.to_s
      retry
    end
  end

  def create_carriage
    puts "Выберите тип(1 - грузовой, 2 - пассажирский, 0 - вернуться в главное меню)"
    selected = gets.chomp.to_i
  loop do
    case selected
    when 1
      puts "Введите обьем вагона"
      @carriages << CargoCarriage.new(gets.chomp.to_i)
      break
    when 2
      puts "Введите кол-во мест для пассажиров"
      @carriages << PassCarriage.new(gets.chomp.to_i)
      break
    else
      break
  end
  end
end
  def print_routes_list
    puts "Список доступных маршрутов"
    @routes.each_with_index { |name, index| puts "#{name.point} => #{index}" }
  end

  def print_stations_list
    puts "Список доступных станций:"
    @stations.each_with_index { |name, index| puts "#{name.name} => #{index}" }
  end

  def print_carriages_list
    puts "Список доступных вагонов:"
    @carriages.each_with_index { |c, index| puts "#{c.type}(#{c.free_space}) => #{index}"}
  end

  def print_train_list
    puts "Список доступных поездов :"
    @trains.each_with_index { |name, index| puts "Поезд номер: #{name.number} => #{index}" }
  end

  def select_station
    print_stations_list
    puts "Введите индекс нужной станции"
    @stations[gets.chomp.to_i]
  end
  def select_carriage
    print_carriages_list
    puts "Введите индекс нужного вагона"
    @carriages[gets.chomp.to_i]
  end
  def create_route
    puts "Начальная станция:"
    first_station = select_station
    puts "Конечная станция"
    last_station = select_station
    @routes << Route.new(first_station, last_station)
  rescue RuntimeError => e
    puts e.message.to_s
    retry
  end

  def select_train
    print_train_list
    puts "Введите индекс нужного поезда"
    @trains[gets.chomp.to_i]
  end

  def give_route
    select_train.set_point(select_route)
  end

  def select_route
    print_routes_list
    puts "Введите индекс нужного маршрута"
    @routes[gets.chomp.to_i]
  end

  def add_in_route
    select_route.add_station(select_station)
  end

  def del_in_route
    select_route.del_station(select_station)
  end

  def hitch_carriage
    t = select_train
    t.add_carriage(select_carriage)
  end

  def del_carriage
    select_train.rem_carriage
  end

  def forward
    select_train.move_forward
  end

  def back
    select_train.move_back
  end

  def print_trains_stations
    s = select_station
    if s.trains.any?
      s.every_train {|t| puts "Поезд номер: #{t.number}, тип: #{t.type}, кол-во вагонов: #{t.carriage.size}"}
    else
      raise "Поездов нет"
    end
  end

  def print_train_carriages
    t = select_train
    t.every_carriage do |c, i|
      print "Вагон номер: #{i + 1}, тип #{c.type}, "
      if t.is_a? CargoTrain
         puts "Кол-во свободного обьема: #{c.free_space}, кол-во занятого обьема: #{c.booked_space}"
      else
        puts "Кол-во свободных мест: #{c.free_space}, кол-во занятых мест: #{c.booked_space}"
      end
    end
  end
  def fill_carriage
    c = select_carriage
    if c.is_a? (CargoCarriage)
      puts "Введите обьем, который нужно заполнить"
      c.booking(gets.chomp.to_i)
    else
      c.booking
    end
  end
end
