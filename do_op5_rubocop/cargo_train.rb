# frozen_string_literal: true

# CargoTrain
class CargoTrain < Train
  def initialize(number)
    super(number)
    @type = 'cargo'
  end

  def add_carriage(carriage)
    super if carriage.is_a?(CargoCarriage)
    raise 'Неподходящий тип вагона' unless carriage.is_a?(CargoCarriage)
  end
end
