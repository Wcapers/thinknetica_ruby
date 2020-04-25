require './manufacturer'
class Carriage
include Manufacturer
attr_reader :space, :booked_space, :free_space

def initialize (space)
  @space = space
  @free_space = space
  @booked_space = 0
end

def booking (n)
  if @booked_space + n <= @space
    @booked_space += n
    @free_space -= n
  else
    raise "Нехватка места"
  end
end

protected

attr_writer :space, :booked_space, :free_space
end
