# frozen_string_literal: true

require './modules/manufacturer'

# Carriage
class Carriage
  include Manufacturer
  attr_reader :space, :booked_space, :type

  def initialize(space)
    @space = space
    @free_space = space
    @booked_space = 0
  end

  def booking(how)
    @booked_space += how if @booked_space + how <= @space
    raise 'Нехватка места' unless @booked_space + how <= @space
  end

  def free_space
    @space - @booked_space
  end
end
