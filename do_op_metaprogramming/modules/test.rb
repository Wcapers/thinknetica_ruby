# frozen_string_literal: true

require './acсesors'
require './valid'

class Test
  extend Accesors
  include Validation
  attr_accessor_with_history :my_attr, :a, :b, :c
  strong_attr_accessor(:q, 'Integer')
  def initialize
    @a = ''
    @b = 'qwe'
    @c = ' '
  end
  validate :a, :type, String
  validate :b, :format, /^qwe/
  validate :c, :presence
end
Test.new.validate!
