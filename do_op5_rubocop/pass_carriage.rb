# frozen_string_literal: true
# PassCarriage

class PassCarriage < Carriage
  def initialize(space)
    super(space)
    @type = 'Pass'
  end

  def booking
    super(1)
  end
end
