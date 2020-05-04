# frozen_string_literal: true

# check validation
module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :validates
    def validate(name, type, options = nil)
      @validates ||= []
      @validates << { name: name, type: type, options: options }
    end
  end

  module InstanceMethods
    def validate!
      self.class.validates.each do |val|
        name = instance_variable_get("@#{val[:name]}")
        send(val[:type], name, val[:options])
      end
    end

    def valid?
      validate!
      true

    rescue StandardError
      false
    end

    def presence(name, _options)
      raise 'Атрибут не инициализирован' if name.nil? || name.empty?
    end

    def format(number, format)
      raise 'Атрибут не подходит' if number.to_s !~ format
    end

    def type(name, type)
      unless name.class.to_s == type.to_s
        raise 'Требуется соответствие значения атрибута заданному классу'
      end
    end
  end
end
