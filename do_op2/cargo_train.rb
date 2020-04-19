class CargoTrain
    def initialize(number)
      super(number)
      @type = "cargo"
    end

    def add_carriage (carriage)
      if carriage.is_a?(CargoCarriage)
        super
      else
        puts "Неподходящий тип вагона"
  end
