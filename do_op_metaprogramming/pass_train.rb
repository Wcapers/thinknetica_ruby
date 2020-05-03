# frozen_string_literal: true

# PassTrain
class PassTrain < Train
  def initialize(number)
    super(number)
    @type = 'cargo'
  end

  def add_carriage(carriage)
    super if carriage.is_a?(PassCarriage)
    raise 'Неподходящий тип вагона' unless carriage.is_a?(PassCarriage)
  end
end
