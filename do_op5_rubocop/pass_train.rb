# frozen_string_literal: true

class PassTrain < Train
  def initialize(number)
    super(number)
    @type = 'cargo'
  end

  def add_carriage(carriage)
    if carriage.is_a?(PassCarriage)
      super
    else
      raise 'Неподходящий тип вагона'
    end
  end
end
