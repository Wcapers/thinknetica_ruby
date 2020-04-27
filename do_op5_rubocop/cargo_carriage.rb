# frozen_string_literal: true

class CargoCarriage < Carriage
  def initialize(space)
    super(space)
    @type = 'Cargo'
  end
end
