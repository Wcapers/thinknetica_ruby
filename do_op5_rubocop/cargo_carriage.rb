# frozen_string_literal: true

# CargoCarriage
class CargoCarriage < Carriage
  def initialize(space)
    super(space)
    @type = 'Cargo'
  end
end
