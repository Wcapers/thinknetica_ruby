# frozen_string_literal: true

require './manufacturer'
class Carriage
  include Manufacturer
  attr_reader :space, :booked_space, :type

  def initialize(space)
    @space = space
    @free_space = space
    @booked_space = 0
  end

  def booking(n)
    if @booked_space + n <= @space
      @booked_space += n
    else
      raise 'Нехватка места'
    end
  end

  def free_space
    @space - @booked_space
  end
end
