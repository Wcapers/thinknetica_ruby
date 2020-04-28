# frozen_string_literal: true

# InstanceCounter
module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  # ClassMethods
  module ClassMethods
    attr_accessor :instances

    def register_instance
      @instances ||= 0
      @instances += 1
    end
  end

  # InstanceMethods
  module InstanceMethods
    private

    def register_instance
      self.class.send :register_instance
    end
  end
end
