module Accesors
  def attr_accessor_with_history(*names)
      names.each do |name|
        var_name = "@#{name}".to_sym
        define_method(name) { instance_variable_get(var_name) }
        define_method("#{name}=".to_sym) do |value|
          @history ||= {}
          @history[name] ||= []
          @history[name] << value
          instance_variable_set(var_name, value)
        end
        define_method("#{name}_history".to_sym) { return @history[name] }
      end
    end
  end

  class Test
    extend Accesors
    attr_accessor_with_history :my_attr, :a, :b, :c
  end
  t = Test.new
  t.a= 12
  t.a= 13
  t.a= 14
  puts "#{t.a_history}"
