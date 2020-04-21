require './train'
require './station'
require './route'
require './pass_train'
require './cargo_train'
require './pass_carriage'
require './cargo_carriage'
=begin
- Создавать станции OK
- Создавать поезда OK
- Создавать маршруты и управлять станциями в нем (добавлять, удалять?) OK
- Назначать маршрут поезду OK?
- Добавлять вагоны к поезду OK?
- Отцеплять вагоны от поезда OK?
- Перемещать поезд по маршруту вперед и назад ОК?
- Просматривать список станций и список поездов на станции Ok?
=end
class Interface
  attr_reader :stations, :trains, :routes

  def initialize
    @stations = Array.new
    @trains = Array.new
    @routes = Array.new
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
      end
    end
  end

  def carriage_menu
    loop do
      puts "Введите 1 - для прицепки вагона, 2 - для отцепки вагона, 0 - веруться назад"
      selected = gets.chomp.to_i
      case selected
      when 1 then hitch_carriage
      when 2 then del_carriage
      when 0 then break
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
      end
    end
  end
  def list_menu
    loop do
      puts "Введите 1 - для просмотра доступных станций, 2 - для просмотра поездов на станции, 0 - веруться назад"
      selected = gets.chomp.to_i
      case selected
      when 1 then print_stations_list
      when 2 then print_trains_stations
      when 0 then break
      end
    end
  end
  def create_station
    puts "Введите имя станции"
    name = gets.chomp.to_sym
    @stations << Station.new(name)
  end
  def create_train
    loop do
      puts "Выберите тип поезда(1 - пассажирский, 2 - грузовой, 0 - веруться в главное меню)"
      selected = gets.to_i
      puts "Введите номер поезда"
      number = gets.to_i
      if selected == 1
        @trains << PassTrain.new(number)
        break
      elsif selected == 2
        @trains << CargoTrain.new(number)
        break
      elsif selected == 0
        start
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

  def print_train_list
    puts "Список доступных поездов :"
    @trains.each_with_index { |name, index| puts "Поезд номер#{name.number} => #{index}" }
  end

  def select_station
    print_stations_list
    puts "Введите индекс нужной станции"
    @stations[gets.chomp.to_i]
  end

  def create_route
    puts "Начальная станция:"
    first_station = select_station
    puts "Конечная станция"
    last_station = select_station
    @routes << Route.new(first_station, last_station)
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
    if t.is_a?(PassTrain)
      t.add_carriage(PassCarriage.new)
    elsif t.is_a?(CargoTrain)
      t.add_carriage(CargoCarriage.new)
    end
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
      s.trains.each{|i| puts "Поезд номер: #{i.number}, тип: #{i.type}"}
    else
      puts "Поездов нет"
    end
  end
end
