require './train'
require './station'
require './route'
require './pass_train'
require './cargo_train'
require './pass_carriage'
require './cargo_carriage'
=begin
- Создавать станции
- Создавать поезда
- Создавать маршруты и управлять станциями в нем (добавлять, удалять)
- Назначать маршрут поезду
- Добавлять вагоны к поезду
- Отцеплять вагоны от поезда
- Перемещать поезд по маршруту вперед и назад
- Просматривать список станций и список поездов на станции
=end
class Interface
  attr_accessor :stations, :trains, :routes

  def initialize
    @stations = Array.new
    @trains = Array.new
    @routes = Array.new
  end
    def start
    loop do
    puts "Введите 1 для создания станции"
    puts "Введите 2 для создания поезда"
    puts "Введите 3 создания и редактирования маршрута" #"Введите 3 для добавления станции в маршрут"
    puts "Введите 4 для назначения маршрута поезду"
    puts "Введите 5 для операций с вагонами"
    puts "Введите 6 для перемещения поезда вперед или назад по маршруту"
    puts "Введите 7 для вывода списка станций или списка поездов"
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

  def create_station
    puts "Введите имя станции"
    name = gets.chomp.to_sym
    @stations << Station.new(name)
  end
  def create_train
    loop do
      puts "Выберите тип поезда(1 - пассажирский, 2 - грузовой, 0 - вернуться назад)"
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

  def route_menu
    loop do
      puts "Введите 1 - для создания маршрута, 2 - для добавления станции в маршрут, 3 - для удаления станции из маршрута, 0 - веруться назад"
      selected = gets.chomp.to_i
      if selected == 1
        create_route
      elsif selected == 2
        add_in_route
      elsif selected == 0
        break
      end
    end
    start
  end
  def print_routes_list
    puts "Список доступных маршрутов"
    @routes.each_with_index { |name, index| puts "#{name.point} => #{index}" }
  end
  def print_stations_list
    puts "Список доступных станций:"
    @stations.each_with_index { |name, index| puts "#{name.name} => #{index}" }
  end

  def select_station
    print_stations_list
    puts "Введите индекс нужной станции"
    gets.chomp.to_i
  end

  def create_route
    puts "Начальной станция:"
    first_station = select_station
    puts "Конечная станции"
    last_station = select_station
    @routes << Route.new(@stations[first_station], @stations[last_station])
  end

  def select_route
    print_routes_list
    puts "Введите индекс нужного маршрута"
    gets.chomp.to_i
  end

  def add_in_route
    r = select_route
    s = select_station
    @routes[r].add_station(@stations[s])
  end
end
