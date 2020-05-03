require './acсesors'
require './valid'

class Test
  extend Accesors
  include Validation
  attr_accessor_with_history :my_attr, :a, :b, :c
  strong_attr_accessor(:q, "Integer")
  end
t = Test.new
t.a= 12
t.a= 13
t.a= 14
t.q= 123
