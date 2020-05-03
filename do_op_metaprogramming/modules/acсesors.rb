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

    def strong_attr_accessor(name, type)
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |value|
      raise 'Тип не совпадает' unless value.class.to_s == type
      instance_variable_set(var_name, value)
      end
    end
  end
