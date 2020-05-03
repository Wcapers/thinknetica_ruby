# frozen_string_literal: true

# check validation
module Validation

    def self.included(base)
      base.extend ClassMethods
      base.send :include, InstanceMethods
    end

  module ClassMethods
    def validate(name, type, options)
    end
  end

  module InstanceMethods
    def presence (name, *options)
      raise 'Атрибут не инициализирован' if name.nil? || name.empty?
    end
    def format (number, format)
      raise 'Атрибут не подходит' if number.to_s !~ format
    end
  end
end
